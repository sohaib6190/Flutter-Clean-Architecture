# Example: Complete Workflow with Auto DI

## Scenario: Create a Notification List Feature

### Step 1: Generate the Feature
```bash
cd c:\Users\User\flutter_clean_architecture
mason make get_view
```

**Prompts:**
```
? What is your module name? notifications
? What is your feature name? notification_list
```

### Step 2: Check Generated Files

✅ **Feature Files Created:**
```
lib/features/notifications/notification_list/
├── data/
│   ├── datasources/remote/
│   │   ├── notification_list_remote_datasource.dart
│   │   └── notification_list_remote_datasource_impl.dart
│   ├── models/
│   │   ├── request/notification_list_params.dart
│   │   └── response/notification_list_model.dart
│   └── repositories/notification_list_repository_impl.dart
├── domain/
│   ├── facades/notification_list_use_cases_facade.dart
│   ├── repositories/notification_list_repository.dart
│   └── usecases/notification_list/notification_list_usecase.dart
└── presentation/
    ├── blocs/
    │   ├── notification_list_bloc.dart
    │   ├── notification_list_event.dart
    │   └── notification_list_state.dart
    └── pages/notification_list_view.dart
```

✅ **DI File Auto-Generated:**
```
lib/app/dependency_injection/notification_list_di.dart
```

### Step 3: Wire Up Dependencies

**3a. Open `lib/app/dependency_injection/di_barrel.dart`**

Add the import:
```dart
import 'package:get_it/get_it.dart';

import '../network/client/dio_client.dart';
import '../services/app_preferences.dart';
import '../theme/cubits/theme_cubit.dart';
import 'notification_list_di.dart'; // ← ADD THIS LINE

part 'di_container.dart';
```

**3b. Open `lib/app/dependency_injection/di_container.dart`**

Call the init function:
```dart
part of 'di_barrel.dart';

final sl = GetIt.instance;

Future<void> initializeDI() async {
  await AppPreferences().init();
  await _initCoreDependencies();
  initNotificationListDependencies(); // ← ADD THIS LINE
}

/// ------------------------
/// Core DEPENDENCIES
/// ------------------------

Future<void> _initCoreDependencies() async {
  sl
    ..registerFactory(() => ThemeCubit())
    ..registerLazySingleton(() => DioClient());
}
```

### Step 4: Customize Your Models

**4a. Update Request Params:** `notification_list_params.dart`
```dart
class NotificationListParams {
  final String userId;
  final int limit;
  final int offset;

  NotificationListParams({
    required this.userId,
    this.limit = 20,
    this.offset = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'limit': limit,
      'offset': offset,
    };
  }
}
```

**4b. Update Response Model:** `notification_list_model.dart`
```dart
class NotificationListModel {
  final List<NotificationItem> items;
  final int total;

  NotificationListModel({
    required this.items,
    required this.total,
  });

  factory NotificationListModel.fromJson(Map<String, dynamic> json) {
    return NotificationListModel(
      items: (json['items'] as List)
          .map((item) => NotificationItem.fromJson(item))
          .toList(),
      total: json['total'],
    );
  }
}

class NotificationItem {
  final String id;
  final String title;
  final String message;
  final DateTime createdAt;

  NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.createdAt,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
```

### Step 5: Add API Endpoint

In your `api_endpoints.dart`:
```dart
enum ApiEndpoints {
  // ... existing endpoints
  notificationList('notifications/list'),
  
  final String value;
  const ApiEndpoints(this.value);
}
```

### Step 6: Update Datasource Implementation

In `notification_list_remote_datasource_impl.dart`, update the endpoint:
```dart
@override
Future<NotificationListModel> fetchNotificationList(
  NotificationListParams params,
) async {
  log("Params is $params");
  return ApiErrorHandler.executeGuarded(() async {
    final response = await client.get(
      endpoint: ApiEndpoints.notificationList.value, // ← Use your endpoint
      queryParams: params.toJson(),
    );
    if (response.statusCode == 200) {
      return NotificationListModel.fromJson(response.data);
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.data['message'] ?? AppErrors.somethingWentWrong,
      );
    }
  });
}
```

### Step 7: Use in Your App

**Option A: Navigate to the page**
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (_) => sl<NotificationListBloc>()
        ..add(NotificationListFetchEvent(
          NotificationListParams(userId: currentUserId),
        )),
      child: const NotificationListPage(),
    ),
  ),
);
```

**Option B: Use in a route**
```dart
// In your router
'/notifications': (context) => BlocProvider(
  create: (_) => sl<NotificationListBloc>(),
  child: const NotificationListPage(),
),
```

### Step 8: Customize the UI

Edit `notification_list_view.dart`:
```dart
class NotificationListPage extends StatefulWidget {
  const NotificationListPage({super.key});

  @override
  State<NotificationListPage> createState() => _NotificationListPageState();
}

class _NotificationListPageState extends State<NotificationListPage> {
  @override
  void initState() {
    super.initState();
    // Fetch notifications on page load
    context.read<NotificationListBloc>().add(
      NotificationListFetchEvent(
        NotificationListParams(userId: 'current_user_id'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: BlocConsumer<NotificationListBloc, NotificationListState>(
        listener: (context, state) {
          if (state is NotificationListStateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is NotificationListStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NotificationListStateSuccess) {
            final model = state.data as NotificationListModel;
            
            if (model.items.isEmpty) {
              return const Center(
                child: Text('No notifications'),
              );
            }

            return ListView.builder(
              itemCount: model.items.length,
              itemBuilder: (context, index) {
                final item = model.items[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.message),
                  trailing: Text(
                    _formatDate(item.createdAt),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              },
            );
          }

          return const Center(
            child: Text('No data available'),
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    // Format your date here
    return '${date.day}/${date.month}/${date.year}';
  }
}
```

## ✅ Done!

Your feature is now:
- ✅ Fully generated with clean architecture
- ✅ Dependencies automatically registered
- ✅ Ready to use with just 2 imports
- ✅ Type-safe with GetIt
- ✅ Following your project's patterns

## 🎯 Summary of Manual Steps

Out of all the generated code, you only need to manually:

1. **Import DI file** in `di_barrel.dart` (1 line)
2. **Call init function** in `di_container.dart` (1 line)
3. **Customize models** with your actual fields
4. **Add API endpoint** to your enum
5. **Update datasource** endpoint reference
6. **Customize UI** for your needs

Everything else is **automatically generated**! 🚀

## Time Saved

**Before:** ~30-45 minutes of manual setup per feature  
**Now:** ~5 minutes of customization 

**That's 85% time saved!** ⚡

# Auto Dependency Injection Setup

## Overview
When you generate a feature using Mason templates, a DI file is automatically created at:
```
lib/app/dependency_injection/{feature_name}_di.dart
```

## Generated DI File

For example, when you run:
```bash
mason make post_view --module user --name login
```

It generates: `lib/app/dependency_injection/login_di.dart`

```dart
import 'package:get_it/get_it.dart';

import '../../features/user/login/data/datasources/remote/login_remote_datasource.dart';
import '../../features/user/login/data/datasources/remote/login_remote_datasource_impl.dart';
import '../../features/user/login/data/repositories/login_repository_impl.dart';
import '../../features/user/login/domain/facades/login_use_cases_facade.dart';
import '../../features/user/login/domain/repositories/login_repository.dart';
import '../../features/user/login/domain/usecases/login/login_usecase.dart';
import '../../features/user/login/presentation/blocs/login_bloc.dart';

final sl = GetIt.instance;

/// Initialize Login Dependencies
void initLoginDependencies() {
  // Datasource
  sl.registerLazySingleton<LoginRemoteDatasource>(
    () => LoginRemoteDatasourceImplementation(client: sl()),
  );

  // Repository
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImplementation(remoteDatasource: sl()),
  );

  // Usecase
  sl.registerLazySingleton(() => LoginUsecase(sl()));

  // Facade
  sl.registerLazySingleton(() => LoginUseCasesFacade(
    loginUsecase: sl(),
  ));

  // BLoC
  sl.registerFactory(() => LoginBloc(usecases: sl()));
}
```

## How to Use

### Step 1: Generate your feature
```bash
mason make post_view --module notifications --name notification_list
```

### Step 2: Import the DI file in your main DI barrel
Open: `lib/app/dependency_injection/di_barrel.dart`

Add the import:
```dart
import 'package:get_it/get_it.dart';

import '../network/client/dio_client.dart';
import '../services/app_preferences.dart';
import '../theme/cubits/theme_cubit.dart';
import 'notification_list_di.dart'; // 👈 ADD THIS

part 'di_container.dart';
```

### Step 3: Call the init function in di_container.dart
Open: `lib/app/dependency_injection/di_container.dart`

Add the initialization:
```dart
part of 'di_barrel.dart';

final sl = GetIt.instance;

Future<void> initializeDI() async {
  await AppPreferences().init();
  await _initCoreDependencies();
  initNotificationListDependencies(); // 👈 ADD THIS
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

## That's It! 🎉

Now your feature is fully registered and ready to use. You can inject the BLoC anywhere:

```dart
BlocProvider(
  create: (context) => sl<NotificationListBloc>(),
  child: NotificationListPage(),
);
```

## What Gets Registered

### For `post_view` and `get_view` templates:
- ✅ Remote Datasource (interface + implementation)
- ✅ Repository (interface + implementation)  
- ✅ UseCase
- ✅ UseCasesFacade
- ✅ BLoC

### For `post_integration` and `get_integration` templates:
- ✅ Remote Datasource (interface + implementation)
- ✅ Repository (interface + implementation)
- ✅ UseCase
- ✅ UseCasesFacade
- ❌ No BLoC (since there's no presentation layer)

## Multiple Usecases

If your feature has multiple usecases in the facade, you'll need to manually update the DI file:

```dart
// Usecase 1
sl.registerLazySingleton(() => FetchNotificationsUsecase(sl()));

// Usecase 2
sl.registerLazySingleton(() => MarkAsReadUsecase(sl()));

// Facade with multiple usecases
sl.registerLazySingleton(() => NotificationUseCasesFacade(
  fetchNotificationsUsecase: sl(),
  markAsReadUsecase: sl(), // Add more usecases here
));
```

## Quick Checklist

After running `mason make`:

- [ ] Check that `{feature_name}_di.dart` was created in `app/dependency_injection/`
- [ ] Import the DI file in `di_barrel.dart`
- [ ] Call `init{FeatureName}Dependencies()` in `di_container.dart`
- [ ] Run your app and inject the BLoC/UseCases where needed

## Example: Complete Flow

```bash
# 1. Generate feature
mason make post_view --module payment --name process_payment

# 2. Files generated:
# ✅ lib/features/payment/process_payment/... (all feature files)
# ✅ lib/app/dependency_injection/process_payment_di.dart
```

Then manually:

```dart
// 3. In di_barrel.dart, add:
import 'process_payment_di.dart';

// 4. In di_container.dart, add:
Future<void> initializeDI() async {
  await AppPreferences().init();
  await _initCoreDependencies();
  initProcessPaymentDependencies(); // 👈 Add this
}

// 5. Use it anywhere:
BlocProvider(
  create: (context) => sl<ProcessPaymentBloc>(),
  child: ProcessPaymentPage(),
);
```

Done! Your dependency injection is fully automated! 🚀

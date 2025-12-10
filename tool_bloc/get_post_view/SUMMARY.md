# get_post_view Brick - Summary

## ✅ Successfully Created

The `get_post_view` brick has been successfully created and registered! It combines both GET and POST functionality into a single Clean Architecture feature.

## 📁 Location
```
tool_bloc/get_post_view/
```

## 🎯 What It Does

Creates a complete feature with:
- **GET endpoint**: Fetches data using `fetch{Name}()` method
- **POST endpoint**: Submits data using `{Name}()` method
- **Two Use Cases**: One for each operation
- **Two BLoC Events**: `{Name}FetchEvent` and `{Name}SubmitEvent`
- **Unified State Management**: Both operations share the same BLoC and states

## 🚀 Usage

```bash
mason make get_post_view --name <FeatureName> --module <ModuleName>
```

### Example:
```bash
mason make get_post_view --name Product --module Inventory
```

This generates:
- **ProductFetchEvent** → GET request to fetch products
- **ProductSubmitEvent** → POST request to create/update products

## 📊 Generated Structure

```
lib/features/{module}/{name}/
├── data/
│   ├── datasources/remote/
│   │   ├── {name}_remote_datasource.dart (interface with both methods)
│   │   └── {name}_remote_datasource_impl.dart (GET + POST implementation)
│   ├── models/
│   │   ├── request/{name}_params.dart
│   │   └── response/{name}_model.dart
│   └── repositories/{name}_repository_impl.dart (both methods)
├── domain/
│   ├── facades/{name}_use_cases_facade.dart (both usecases)
│   ├── repositories/{name}_repository.dart (both methods)
│   └── usecases/
│       ├── fetch_{name}/fetch_{name}_usecase.dart (GET)
│       └── {name}/{name}_usecase.dart (POST)
└── presentation/
    ├── blocs/
    │   ├── {name}_bloc.dart (both event handlers)
    │   ├── {name}_event.dart (FetchEvent + SubmitEvent)
    │   └── {name}_state.dart
    └── pages/{name}_view.dart
```

## 🔑 Key Features

### 1. **Datasource**
```dart
abstract class ProfileRemoteDatasource {
  Future<ProfileModel> fetchProfile(ProfileParams params);  // GET
  Future<ProfileModel> profile(ProfileParams params);       // POST
}
```

### 2. **Repository**
```dart
abstract class ProfileRepository {
  Future<Either<Failure, ProfileModel>> fetchProfile(ProfileParams params);
  Future<Either<Failure, ProfileModel>> profile(ProfileParams params);
}
```

### 3. **Use Cases**
- `FetchProfileUsecase` → Calls `repository.fetchProfile()`
- `ProfileUsecase` → Calls `repository.profile()`

### 4. **Facade**
```dart
class ProfileUseCasesFacade {
  final FetchProfileUsecase fetchProfileUsecase;
  final ProfileUsecase profileUsecase;
  
  Future<Either<Failure, ProfileModel>> fetchProfile(params) => fetchProfileUsecase(params);
  Future<Either<Failure, ProfileModel>> profile(params) => profileUsecase(params);
}
```

### 5. **BLoC Events**
```dart
class ProfileFetchEvent extends ProfileEvent {
  final dynamic params;
  const ProfileFetchEvent(this.params);
}

class ProfileSubmitEvent extends ProfileEvent {
  final dynamic data;
  const ProfileSubmitEvent(this.data);
}
```

### 6. **BLoC**
```dart
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.usecases}) : super(ProfileStateInitial()) {
    on<ProfileFetchEvent>(_onProfileFetch);   // Handles GET
    on<ProfileSubmitEvent>(_onProfileSubmit); // Handles POST
  }
}
```

## 📚 Documentation

Created documentation files:
- **README.md** - Overview and usage
- **QUICK_REFERENCE.md** - Quick comparison and guide
- **EXAMPLE_WORKFLOW.md** - Complete example with code

## ✨ Advantages

1. **Single Source of Truth**: One BLoC manages both operations
2. **Coordinated Operations**: Easy to fetch after submit
3. **Less Boilerplate**: No need for two separate features
4. **Unified State**: Shared loading, success, and failure states
5. **Clean Architecture**: Maintains all clean architecture principles

## 🔄 Comparison with Separate Bricks

| Aspect | get_view + post_view | get_post_view |
|--------|---------------------|---------------|
| BLoCs | 2 separate | 1 combined |
| Use Cases | 2 separate | 2 in same feature |
| Events | Separate per BLoC | Both in same BLoC |
| State | Independent | Shared |
| Coordination | Manual | Built-in |

## 🎉 Ready to Use!

The brick is now available in your Mason registry:
```bash
mason list
```

You should see:
```
├── get_post_view 0.1.0+1 -> tool_bloc/get_post_view
```

Happy coding! 🚀

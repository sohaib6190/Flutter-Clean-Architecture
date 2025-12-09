# Tool BLoC Templates - Updated for Current Project Structure

## Overview
All tool_bloc templates have been updated to match your current Flutter Clean Architecture project structure. The templates now follow the exact patterns, naming conventions, and folder structure used in your project.

## 🎉 NEW: Automatic Dependency Injection
**All templates now automatically generate DI files!** When you run `mason make`, a dependency injection file is created at `lib/app/dependency_injection/{feature_name}_di.dart` with all registrations ready. See [DI_SETUP.md](DI_SETUP.md) for details.

## Architecture Structure

### Features Folder Structure
```
lib/features/{module}/{feature_name}/
├── data/
│   ├── datasources/
│   │   └── remote/
│   │       ├── {feature}_remote_datasource.dart
│   │       └── {feature}_remote_datasource_impl.dart
│   ├── models/
│   │   ├── request/
│   │   │   └── {feature}_params.dart
│   │   └── response/
│   │       └── {feature}_model.dart
│   └── repositories/
│       └── {feature}_repository_impl.dart
├── domain/
│   ├── facades/
│   │   └── {feature}_use_cases_facade.dart
│   ├── repositories/
│   │   └── {feature}_repository.dart
│   └── usecases/
│       └── {feature}/
│           └── {feature}_usecase.dart
└── presentation/
    ├── blocs/
    │   ├── {feature}_bloc.dart
    │   ├── {feature}_event.dart
    │   └── {feature}_state.dart
    ├── pages/
    │   └── {feature}_view.dart
    └── widgets/
```

## Available Templates

### 1. **post_view**
Creates a complete POST API feature with:
- Full presentation layer (BLoC, Events, States, Pages)
- Domain layer (Facade, Repository interface, UseCase)
- Data layer (Repository implementation, Remote datasource, Models)
- Uses POST method for API calls
- Includes request params and response models

**Usage:**
```bash
mason make post_view
```

### 2. **get_view**
Creates a complete GET API feature with:
- Full presentation layer (BLoC with fetch event, States, Pages)
- Domain layer (Facade, Repository interface, UseCase)
- Data layer (Repository implementation, Remote datasource, Models)
- Uses GET method with query parameters
- Includes automatic data fetching on page init

**Usage:**
```bash
mason make get_view
```

### 3. **post_integration**
Creates POST API integration without UI:
- Domain layer (Facade, Repository interface, UseCase)
- Data layer (Repository implementation, Remote datasource, Models)
- No presentation layer
- Perfect for adding new API endpoints to existing features

**Usage:**
```bash
mason make post_integration
```

### 4. **get_integration**
Creates GET API integration without UI:
- Domain layer (Facade, Repository interface, UseCase)
- Data layer (Repository implementation, Remote datasource, Models)
- No presentation layer
- Perfect for adding new fetch endpoints to existing features

**Usage:**
```bash
mason make get_integration
```

## Key Features

### BLoC Pattern
- Uses **Equatable** for state management
- Separate event and state files (not part files)
- Clean event naming: `{Feature}SubmitEvent`, `{Feature}FetchEvent`
- Clear state classes: `Initial`, `Loading`, `Success`, `Failure`

### Repository Pattern
- Abstract repository interfaces in domain layer
- Concrete implementations in data layer
- Uses **fpdart's Either** for error handling
- Follows your existing `Failure` error model

### UseCase Pattern
- Extends the base `UseCase<Type, Params>` class
- Single responsibility principle
- Clean dependency injection

### Facade Pattern
- `UseCasesFacade` aggregates multiple usecases
- Simplifies BLoC dependencies
- Matches your todo_listing structure

### Data Layer
- Remote datasource abstraction
- Uses your existing `DioClient`
- Integrates with `ApiErrorHandler.executeGuarded()`
- Uses your `ApiEndpoints` enum
- Proper error handling with `ServerException`

### Models
- Request models with `toJson()` method
- Response models with `fromJson()` factory
- Simple, extensible structure

## Example Usage

### Creating a User Profile Feature (GET)

```bash
mason make get_view
# When prompted:
# module: user
# name: profile
```

This generates:
```
lib/features/user/profile/
├── data/
│   ├── datasources/remote/
│   │   ├── profile_remote_datasource.dart
│   │   └── profile_remote_datasource_impl.dart
│   ├── models/
│   │   ├── request/profile_params.dart
│   │   └── response/profile_model.dart
│   └── repositories/profile_repository_impl.dart
├── domain/
│   ├── facades/profile_use_cases_facade.dart
│   ├── repositories/profile_repository.dart
│   └── usecases/profile/profile_usecase.dart
└── presentation/
    ├── blocs/
    │   ├── profile_bloc.dart
    │   ├── profile_event.dart
    │   └── profile_state.dart
    └── pages/profile_view.dart
```

**PLUS:** `lib/app/dependency_injection/profile_di.dart` ← DI file auto-generated! 🎉
│   │   ├── request/profile_params.dart
│   │   └── response/profile_model.dart
│   └── repositories/profile_repository_impl.dart
├── domain/
│   ├── facades/profile_use_cases_facade.dart
│   ├── repositories/profile_repository.dart
│   └── usecases/profile/profile_usecase.dart
└── presentation/
    ├── blocs/
    │   ├── profile_bloc.dart
    │   ├── profile_event.dart
    │   └── profile_state.dart
    └── pages/profile_view.dart
```

### Creating an Update Profile Feature (POST)

```bash
mason make post_view
# When prompted:
# module: user
# name: update_profile
```

### Adding a New API Endpoint to Existing Feature

```bash
mason make post_integration
# When prompted:
# module: user
# name: delete_account
```

## Customization Required

After generation, you'll need to:

1. **Update Models**: Add your actual request/response fields
2. **Update API Endpoints**: Add the endpoint to your `ApiEndpoints` enum
3. **Update Datasource**: Modify the API call parameters as needed
4. **Update UI**: Customize the page/widgets for your specific needs
5. **Wire up DI**: Import and call the generated DI function (see [DI_SETUP.md](DI_SETUP.md))

## Dependency Injection Setup

The template automatically generates a DI file at `lib/app/dependency_injection/{feature_name}_di.dart`.

**You just need to:**
1. Import it in `di_barrel.dart`
2. Call `init{FeatureName}Dependencies()` in `di_container.dart`

See detailed instructions in **[DI_SETUP.md](DI_SETUP.md)** ← Click here!

## Naming Conventions

The templates use Mason's variable transformations:
- `{{name.pascalCase()}}` → ProfileBloc
- `{{name.camelCase()}}` → profileBloc
- `{{name.snakeCase()}}` → profile_bloc
- `{{module.snakeCase()}}` → user

## Dependencies Used

All templates use your project's existing dependencies:
- `flutter_bloc` - State management
- `equatable` - Value equality
- `fpdart` - Functional programming (Either)
- Your custom `DioClient`, `ApiErrorHandler`, `Failure` classes

## Notes

- Templates include placeholder/example code that you need to customize
- The structure matches your existing `todo_listing` and `auth` features
- All imports use relative paths for portability
- Follows your existing error handling patterns
- Compatible with your current architecture

## Next Steps

1. Run `mason get` to update Mason cache
2. Generate your first feature using `mason make post_view` or `mason make get_view`
3. Customize the generated code for your specific needs
4. Add dependency injection configurations
5. Test the generated code

Happy coding! 🚀

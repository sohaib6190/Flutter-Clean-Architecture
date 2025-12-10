# get_post_view - Complete Example

## Generating a Feature

Let's create a **Profile** feature that can both fetch and update user profile data:

```bash
mason make get_post_view --name Profile --module User
```

## Generated Files

```
lib/
  features/
    user/
      profile/
        data/
          datasources/
            remote/
              profile_remote_datasource.dart          # Interface with fetch & submit
              profile_remote_datasource_impl.dart     # Implementation with GET & POST
          models/
            request/
              profile_params.dart                     # Request parameters
            response/
              profile_model.dart                      # Response model
          repositories/
            profile_repository_impl.dart              # Repository implementation
        domain/
          facades/
            profile_use_cases_facade.dart             # Facade with both methods
          repositories/
            profile_repository.dart                   # Repository interface
          usecases/
            fetch_profile/
              fetch_profile_usecase.dart              # GET use case
            profile/
              profile_usecase.dart                    # POST use case
        presentation/
          blocs/
            profile_bloc.dart                         # BLoC with both handlers
            profile_event.dart                        # FetchEvent + SubmitEvent
            profile_state.dart                        # States
          pages/
            profile_view.dart                         # UI page
```

## Key Generated Code Snippets

### 1. Datasource Interface
```dart
abstract class ProfileRemoteDatasource {
  Future<ProfileModel> fetchProfile(ProfileParams params);
  Future<ProfileModel> profile(ProfileParams params);
}
```

### 2. Datasource Implementation
```dart
class ProfileRemoteDatasourceImplementation {
  @override
  Future<ProfileModel> fetchProfile(ProfileParams params) async {
    final response = await client.get(
      endpoint: ApiEndpoints.profile.value,
      queryParams: params.toJson(),  // GET uses query params
    );
    // ...
  }

  @override
  Future<ProfileModel> profile(ProfileParams params) async {
    final response = await client.post(
      endpoint: ApiEndpoints.profile.value,
      data: params.toJson(),  // POST uses body
    );
    // ...
  }
}
```

### 3. Facade
```dart
class ProfileUseCasesFacade {
  final FetchProfileUsecase fetchProfileUsecase;
  final ProfileUsecase profileUsecase;

  Future<Either<Failure, ProfileModel>> fetchProfile(ProfileParams params) {
    return fetchProfileUsecase(params);  // Calls GET
  }

  Future<Either<Failure, ProfileModel>> profile(ProfileParams params) {
    return profileUsecase(params);  // Calls POST
  }
}
```

### 4. BLoC Events
```dart
abstract class ProfileEvent extends Equatable {}

class ProfileFetchEvent extends ProfileEvent {
  final dynamic params;
  const ProfileFetchEvent(this.params);
}

class ProfileSubmitEvent extends ProfileEvent {
  final dynamic data;
  const ProfileSubmitEvent(this.data);
}
```

### 5. BLoC Handlers
```dart
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.usecases}) : super(ProfileStateInitial()) {
    on<ProfileFetchEvent>(_onProfileFetch);
    on<ProfileSubmitEvent>(_onProfileSubmit);
  }

  Future<void> _onProfileFetch(ProfileFetchEvent event, ...) async {
    emit(ProfileStateLoading());
    final result = await usecases.fetchProfile(event.params);
    // Handle result...
  }

  Future<void> _onProfileSubmit(ProfileSubmitEvent event, ...) async {
    emit(ProfileStateLoading());
    final result = await usecases.profile(event.data);
    // Handle result...
  }
}
```

### 6. Dependency Injection
```dart
Future<void> _initProfileDependencies() async {
  // Datasource
  sl.registerLazySingleton<ProfileRemoteDatasource>(
    () => ProfileRemoteDatasourceImplementation(client: sl()),
  );

  // Repository
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImplementation(remoteDatasource: sl()),
  );

  // Both usecases
  sl.registerLazySingleton(() => FetchProfileUsecase(sl()));
  sl.registerLazySingleton(() => ProfileUsecase(sl()));

  // Facade
  sl.registerLazySingleton(() => ProfileUseCasesFacade(
    fetchProfileUsecase: sl(),
    profileUsecase: sl(),
  ));

  // BLoC
  sl.registerFactory(() => ProfileBloc(usecases: sl()));
}
```

## Usage in UI

```dart
// Fetch profile data
BlocProvider(
  create: (context) => sl<ProfileBloc>()
    ..add(ProfileFetchEvent(ProfileParams(userId: '123'))),
  child: ProfileView(),
)

// Update profile
ElevatedButton(
  onPressed: () {
    context.read<ProfileBloc>().add(
      ProfileSubmitEvent({
        'name': 'John Doe',
        'email': 'john@example.com',
      }),
    );
  },
  child: Text('Update Profile'),
)
```

## Comparison with Separate Bricks

### Using get_post_view (Single BLoC)
✅ Both operations in one place
✅ Shared state management
✅ Easier to coordinate GET after POST
✅ Less boilerplate

### Using get_view + post_view (Two BLocs)
✅ Clear separation of concerns
✅ Independent state for each operation
✅ Can be scaled independently
✅ More granular control

Choose based on your specific use case!

part of 'di_barrel.dart';

final sl = GetIt.instance;

Future<void> initializeDI() async {
  await AppPreferences().init();
  await _initCoreDependencies();
  await _initAuthDependencies();
  await _initProductListingDependencies();
 

}

/// ------------------------
/// Core DEPENDENCIES
/// ------------------------

Future<void> _initCoreDependencies() async {
  sl
    ..registerFactory(() => ThemeCubit())
    ..registerLazySingleton(() => DioClient());
}


/// ------------------------
/// AUTH DEPENDENCIES
/// ------------------------

Future<void> _initAuthDependencies() async {
  sl.registerLazySingleton(() => UserCubit());
  _registerAuthRemoteDatasources();
  _registerAuthRepositories();
  _registerAuthUsecases();
  _registerAuthBloc();
}

void _registerAuthRemoteDatasources() {
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImplementation(client: sl()),
  );
}

void _registerAuthRepositories() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImplementation(remoteDataSource: sl()),
  );
}

void _registerAuthUsecases() {
  sl
    ..registerLazySingleton(() => LoginUseCase(sl()))
    ..registerLazySingleton(() => LogoutUseCase(sl()))
    ..registerLazySingleton(() => SignupUseCase(sl()))
    ..registerLazySingleton(() => FetchSecretKeyUsecase(sl()))
    ..registerLazySingleton(() => Add2FAUseCase(sl()))
    ..registerLazySingleton(() => VerifyOtpUseCase(sl()))
    ..registerLazySingleton(() => Remove2FAUseCase(sl()))
    ..registerLazySingleton(() => ChangePasswordUsecase(sl()))
    ..registerLazySingleton(() => ForgetPasswordUsecase(sl()))
    ..registerLazySingleton(() => VerifyOtpForgetPasswordUsecase(sl()))
    ..registerLazySingleton(() => ResetPasswordUsecase(sl()));
}

void _registerAuthBloc() {
  sl.registerFactory(
    () => AuthenticationBloc(
      loginUseCase: sl(),
      logoutUseCase: sl(),
      userCubit: sl(),
      getSecretKeyUsecase: sl(),
      add2FAUseCase: sl(),
      remove2FAUseCase: sl(),
      verifyOptUseCase: sl(),
      changePasswordUseCase: sl(),
      forgetPasswordUsecase: sl(),
      verifyOtpForgetPasswordUsecase: sl(),
      resetPasswordUsecase: sl(),
    ),
  );
}

/// ------------------------
/// ProductListing DEPENDENCIES
/// ------------------------

Future<void> _initProductListingDependencies() async {
  // Datasource
  sl.registerLazySingleton<ProductListingRemoteDatasource>(
    () => ProductListingRemoteDatasourceImplementation(client: sl()),
  );

  // Repository
  sl.registerLazySingleton<ProductListingRepository>(
    () => ProductListingRepositoryImplementation(remoteDatasource: sl()),
  );

  // Usecase
  sl.registerLazySingleton(() => ProductListingUsecase(sl()));

  // Facade
  sl.registerLazySingleton(() => ProductListingUseCasesFacade(
    productListingUsecase: sl(),
  ));

  // BLoC
  sl.registerFactory(() => ProductListingBloc(usecases: sl()));
}


/// ------------------------
/// TestFeature DEPENDENCIES
/// ------------------------

Future<void> _initTestFeatureDependencies() async {
  // Datasource
  sl.registerLazySingleton<TestFeatureRemoteDatasource>(
    () => TestFeatureRemoteDatasourceImplementation(client: sl()),
  );

  // Repository
  sl.registerLazySingleton<TestFeatureRepository>(
    () => TestFeatureRepositoryImplementation(remoteDatasource: sl()),
  );

  // Usecase
  sl.registerLazySingleton(() => TestFeatureUsecase(sl()));

  // Facade
  sl.registerLazySingleton(() => TestFeatureUseCasesFacade(
    testFeatureUsecase: sl(),
  ));

  // BLoC
  sl.registerFactory(() => TestFeatureBloc(usecases: sl()));
}

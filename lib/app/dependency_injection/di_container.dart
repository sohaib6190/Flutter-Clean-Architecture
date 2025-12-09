part of 'di_barrel.dart';

final sl = GetIt.instance;

Future<void> initializeDI() async {
  await AppPreferences().init();
  await _initCoreDependencies();
  await _initProductDependencies();
  await _initCsDependencies();
  await _initMechanicalDependencies();

}

/// ------------------------
/// Core DEPENDENCIES
/// ------------------------

Future<void> _initCoreDependencies() async {
  sl
    ..registerFactory(() => ThemeCubit())
    ..registerLazySingleton(() => DioClient());
}

Future<void> _initProductDependencies() async {
  // Datasource
  sl.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImplementation(client: sl()),
  );

  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImplementation(remoteDatasource: sl()),
  );

  // Usecase
  sl.registerLazySingleton(() => ProductUsecase(sl()));

  // Facade
  sl.registerLazySingleton(() => ProductUseCasesFacade(
    productUsecase: sl(),
  ));

  // BLoC
  sl.registerFactory(() => ProductBloc(usecases: sl()));
}


/// ------------------------
/// Cs DEPENDENCIES
/// ------------------------

Future<void> _initCsDependencies() async {
  // Datasource
  sl.registerLazySingleton<CsRemoteDatasource>(
    () => CsRemoteDatasourceImplementation(client: sl()),
  );

  // Repository
  sl.registerLazySingleton<CsRepository>(
    () => CsRepositoryImplementation(remoteDatasource: sl()),
  );

  // Usecase
  sl.registerLazySingleton(() => CsUsecase(sl()));

  // Facade
  sl.registerLazySingleton(() => CsUseCasesFacade(
    csUsecase: sl(),
  ));

  // BLoC
  sl.registerFactory(() => CsBloc(usecases: sl()));
}


/// ------------------------
/// Mechanical DEPENDENCIES
/// ------------------------

Future<void> _initMechanicalDependencies() async {
  // Datasource
  sl.registerLazySingleton<MechanicalRemoteDatasource>(
    () => MechanicalRemoteDatasourceImplementation(client: sl()),
  );

  // Repository
  sl.registerLazySingleton<MechanicalRepository>(
    () => MechanicalRepositoryImplementation(remoteDatasource: sl()),
  );

  // Usecase
  sl.registerLazySingleton(() => MechanicalUsecase(sl()));

  // Facade
  sl.registerLazySingleton(() => MechanicalUseCasesFacade(
    mechanicalUsecase: sl(),
  ));

  // BLoC
  sl.registerFactory(() => MechanicalBloc(usecases: sl()));
}


/// ------------------------
/// Electrical DEPENDENCIES
/// ------------------------

Future<void> _initElectricalDependencies() async {
  // Datasource
  sl.registerLazySingleton<ElectricalRemoteDatasource>(
    () => ElectricalRemoteDatasourceImplementation(client: sl()),
  );

  // Repository
  sl.registerLazySingleton<ElectricalRepository>(
    () => ElectricalRepositoryImplementation(remoteDatasource: sl()),
  );

  // Usecase
  sl.registerLazySingleton(() => ElectricalUsecase(sl()));

  // Facade
  sl.registerLazySingleton(() => ElectricalUseCasesFacade(
    electricalUsecase: sl(),
  ));

  // BLoC
  sl.registerFactory(() => ElectricalBloc(usecases: sl()));
}




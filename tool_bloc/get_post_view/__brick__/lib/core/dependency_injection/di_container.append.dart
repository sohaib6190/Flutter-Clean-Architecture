// ============================================================
// ADD THIS TO di_container.dart (at the end, before the last closing brace)
// ============================================================

/// ------------------------
/// {{name.pascalCase()}} DEPENDENCIES
/// ------------------------

Future<void> _init{{name.pascalCase()}}Dependencies() async {
  // Datasource
  sl.registerLazySingleton<{{name.pascalCase()}}RemoteDatasource>(
    () => {{name.pascalCase()}}RemoteDatasourceImplementation(client: sl()),
  );

  // Repository
  sl.registerLazySingleton<{{name.pascalCase()}}Repository>(
    () => {{name.pascalCase()}}RepositoryImplementation(remoteDatasource: sl()),
  );

  // Usecases (both GET and POST)
  sl.registerLazySingleton(() => Fetch{{name.pascalCase()}}Usecase(sl()));
  sl.registerLazySingleton(() => {{name.pascalCase()}}Usecase(sl()));

  // Facade
  sl.registerLazySingleton(() => {{name.pascalCase()}}UseCasesFacade(
    fetch{{name.pascalCase()}}Usecase: sl(),
    {{name.camelCase()}}Usecase: sl(),
  ));

  // BLoC
  sl.registerFactory(() => {{name.pascalCase()}}Bloc(usecases: sl()));
}

// ============================================================
// Also call this function in initializeDI():
//   await _init{{name.pascalCase()}}Dependencies();
// ============================================================

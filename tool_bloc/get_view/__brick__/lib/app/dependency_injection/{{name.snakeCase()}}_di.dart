import 'package:get_it/get_it.dart';

import '../../../features/{{module.snakeCase()}}/{{name.snakeCase()}}/data/datasources/remote/{{name.snakeCase()}}_remote_datasource.dart';
import '../../../features/{{module.snakeCase()}}/{{name.snakeCase()}}/data/datasources/remote/{{name.snakeCase()}}_remote_datasource_impl.dart';
import '../../../features/{{module.snakeCase()}}/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_repository_impl.dart';
import '../../../features/{{module.snakeCase()}}/{{name.snakeCase()}}/domain/facades/{{name.snakeCase()}}_use_cases_facade.dart';
import '../../../features/{{module.snakeCase()}}/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../../../features/{{module.snakeCase()}}/{{name.snakeCase()}}/domain/usecases/{{name.snakeCase()}}/{{name.snakeCase()}}_usecase.dart';
import '../../../features/{{module.snakeCase()}}/{{name.snakeCase()}}/presentation/blocs/{{name.snakeCase()}}_bloc.dart';

final sl = GetIt.instance;

/// ------------------------
/// {{name.pascalCase()}} DEPENDENCIES
/// ------------------------


/// Initialize {{name.pascalCase()}} Dependencies
void init{{name.pascalCase()}}Dependencies() {
  // Datasource
  sl.registerLazySingleton<{{name.pascalCase()}}RemoteDatasource>(
    () => {{name.pascalCase()}}RemoteDatasourceImplementation(client: sl()),
  );

  // Repository
  sl.registerLazySingleton<{{name.pascalCase()}}Repository>(
    () => {{name.pascalCase()}}RepositoryImplementation(remoteDatasource: sl()),
  );

  // Usecase
  sl.registerLazySingleton(() => {{name.pascalCase()}}Usecase(sl()));

  // Facade
  sl.registerLazySingleton(() => {{name.pascalCase()}}UseCasesFacade(
    {{name.camelCase()}}Usecase: sl(),
  ));

  // BLoC
  sl.registerFactory(() => {{name.pascalCase()}}Bloc(usecases: sl()));
}

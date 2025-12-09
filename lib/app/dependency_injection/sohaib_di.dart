import 'package:get_it/get_it.dart';

import '../../features/qamar/sohaib/data/datasources/remote/sohaib_remote_datasource.dart';
import '../../features/qamar/sohaib/data/datasources/remote/sohaib_remote_datasource_impl.dart';
import '../../features/qamar/sohaib/data/repositories/sohaib_repository_impl.dart';
import '../../features/qamar/sohaib/domain/facades/sohaib_use_cases_facade.dart';
import '../../features/qamar/sohaib/domain/repositories/sohaib_repository.dart';
import '../../features/qamar/sohaib/domain/usecases/sohaib/sohaib_usecase.dart';
import '../../features/qamar/sohaib/presentation/blocs/sohaib_bloc.dart';

final sl = GetIt.instance;

/// Initialize Sohaib Dependencies
void initSohaibDependencies() {
  // Datasource
  sl.registerLazySingleton<SohaibRemoteDatasource>(
    () => SohaibRemoteDatasourceImplementation(client: sl()),
  );

  // Repository
  sl.registerLazySingleton<SohaibRepository>(
    () => SohaibRepositoryImplementation(remoteDatasource: sl()),
  );

  // Usecase
  sl.registerLazySingleton(() => SohaibUsecase(sl()));

  // Facade
  sl.registerLazySingleton(() => SohaibUseCasesFacade(
    sohaibUsecase: sl(),
  ));

  // BLoC
  sl.registerFactory(() => SohaibBloc(usecases: sl()));
}

import 'package:get_it/get_it.dart';

import '../../../features/cart/cart_listing/data/datasources/remote/cart_listing_remote_datasource.dart';
import '../../../features/cart/cart_listing/data/datasources/remote/cart_listing_remote_datasource_impl.dart';
import '../../../features/cart/cart_listing/data/repositories/cart_listing_repository_impl.dart';
import '../../../features/cart/cart_listing/domain/facades/cart_listing_use_cases_facade.dart';
import '../../../features/cart/cart_listing/domain/repositories/cart_listing_repository.dart';
import '../../../features/cart/cart_listing/domain/usecases/cart_listing/cart_listing_usecase.dart';
import '../../../features/cart/cart_listing/presentation/blocs/cart_listing_bloc.dart';

final sl = GetIt.instance;

/// ------------------------
/// CartListing DEPENDENCIES
/// ------------------------


/// Initialize CartListing Dependencies
void initCartListingDependencies() {
  // Datasource
  sl.registerLazySingleton<CartListingRemoteDatasource>(
    () => CartListingRemoteDatasourceImplementation(client: sl()),
  );

  // Repository
  sl.registerLazySingleton<CartListingRepository>(
    () => CartListingRepositoryImplementation(remoteDatasource: sl()),
  );

  // Usecase
  sl.registerLazySingleton(() => CartListingUsecase(sl()));

  // Facade
  sl.registerLazySingleton(() => CartListingUseCasesFacade(
    cartListingUsecase: sl(),
  ));

  // BLoC
  sl.registerFactory(() => CartListingBloc(usecases: sl()));
}

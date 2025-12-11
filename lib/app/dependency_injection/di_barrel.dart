

import 'package:get_it/get_it.dart';


import '../../auth/data/data_sources/remote/auth_remote_datasource.dart';
import '../../auth/data/repositories/auth_repository_impl.dart';
import '../../auth/domain/repositories/auth_repository.dart';
import '../../auth/domain/usecases/add_two_fa_usecase.dart';
import '../../auth/domain/usecases/change_password_usecase.dart';
import '../../auth/domain/usecases/fetch_secret_key_usecase.dart';
import '../../auth/domain/usecases/forget_password_usecase.dart';
import '../../auth/domain/usecases/login_usecase.dart';
import '../../auth/domain/usecases/logout_usecase.dart';
import '../../auth/domain/usecases/remove_two_fa_usecase.dart';
import '../../auth/domain/usecases/reset_password_usecase.dart';
import '../../auth/domain/usecases/signup_usecase.dart';
import '../../auth/domain/usecases/verify_otp_forget_password_usecase.dart';
import '../../auth/domain/usecases/verify_otp_usecase.dart';
import '../../auth/presentation/blocs/auth_bloc.dart';
import '../../auth/presentation/cubits/user_cubit.dart';
import '../network/client/dio_client.dart';
import '../services/app_preferences.dart';
import '../theme/cubits/theme_cubit.dart';
import '../../features/product/product_listing/data/datasources/remote/product_listing_remote_datasource.dart';
import '../../features/product/product_listing/data/datasources/remote/product_listing_remote_datasource_impl.dart';
import '../../features/product/product_listing/data/repositories/product_listing_repository_impl.dart';
import '../../features/product/product_listing/domain/facades/product_listing_use_cases_facade.dart';
import '../../features/product/product_listing/domain/repositories/product_listing_repository.dart';
import '../../features/product/product_listing/domain/usecases/product_listing/product_listing_usecase.dart';
import '../../features/product/product_listing/presentation/blocs/product_listing_bloc.dart';


part 'di_container.dart';

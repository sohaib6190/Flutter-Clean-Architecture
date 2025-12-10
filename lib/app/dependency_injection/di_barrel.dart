

import 'package:get_it/get_it.dart';

import '../../features/phone/camera/domain/usecases/fetch_camera/fetch_camera_usecase.dart';
import '../network/client/dio_client.dart';
import '../services/app_preferences.dart';
import '../theme/cubits/theme_cubit.dart';
import '../../features/shop/product/data/datasources/remote/product_remote_datasource.dart';
import '../../features/shop/product/data/datasources/remote/product_remote_datasource_impl.dart';
import '../../features/shop/product/data/repositories/product_repository_impl.dart';
import '../../features/shop/product/domain/facades/product_use_cases_facade.dart';
import '../../features/shop/product/domain/repositories/product_repository.dart';
import '../../features/shop/product/domain/usecases/product/product_usecase.dart';
import '../../features/shop/product/presentation/blocs/product_bloc.dart';
import '../../features/suffa/cs/data/datasources/remote/cs_remote_datasource.dart';
import '../../features/suffa/cs/data/datasources/remote/cs_remote_datasource_impl.dart';
import '../../features/suffa/cs/data/repositories/cs_repository_impl.dart';
import '../../features/suffa/cs/domain/facades/cs_use_cases_facade.dart';
import '../../features/suffa/cs/domain/repositories/cs_repository.dart';
import '../../features/suffa/cs/domain/usecases/cs/cs_usecase.dart';
import '../../features/suffa/cs/presentation/blocs/cs_bloc.dart';
import '../../features/suffa/mechanical/data/datasources/remote/mechanical_remote_datasource.dart';
import '../../features/suffa/mechanical/data/datasources/remote/mechanical_remote_datasource_impl.dart';
import '../../features/suffa/mechanical/data/repositories/mechanical_repository_impl.dart';
import '../../features/suffa/mechanical/domain/facades/mechanical_use_cases_facade.dart';
import '../../features/suffa/mechanical/domain/repositories/mechanical_repository.dart';
import '../../features/suffa/mechanical/domain/usecases/mechanical/mechanical_usecase.dart';
import '../../features/suffa/mechanical/presentation/blocs/mechanical_bloc.dart';
import '../../features/suffa/electrical/data/datasources/remote/electrical_remote_datasource.dart';
import '../../features/suffa/electrical/data/datasources/remote/electrical_remote_datasource_impl.dart';
import '../../features/suffa/electrical/data/repositories/electrical_repository_impl.dart';
import '../../features/suffa/electrical/domain/facades/electrical_use_cases_facade.dart';
import '../../features/suffa/electrical/domain/repositories/electrical_repository.dart';
import '../../features/suffa/electrical/domain/usecases/electrical/electrical_usecase.dart';
import '../../features/suffa/electrical/presentation/blocs/electrical_bloc.dart';
import '../../features/phone/camera/data/datasources/remote/camera_remote_datasource.dart';
import '../../features/phone/camera/data/datasources/remote/camera_remote_datasource_impl.dart';
import '../../features/phone/camera/data/repositories/camera_repository_impl.dart';
import '../../features/phone/camera/domain/facades/camera_use_cases_facade.dart';
import '../../features/phone/camera/domain/repositories/camera_repository.dart';
import '../../features/phone/camera/domain/usecases/camera/camera_usecase.dart';
import '../../features/phone/camera/presentation/blocs/camera_bloc.dart';


part 'di_container.dart';

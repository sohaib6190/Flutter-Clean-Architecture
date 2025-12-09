// ============================================================
// ADD THESE IMPORTS TO di_barrel.dart (after existing imports, before part directive)
// ============================================================

import '../../features/{{module.snakeCase()}}/{{name.snakeCase()}}/data/datasources/remote/{{name.snakeCase()}}_remote_datasource.dart';
import '../../features/{{module.snakeCase()}}/{{name.snakeCase()}}/data/datasources/remote/{{name.snakeCase()}}_remote_datasource_impl.dart';
import '../../features/{{module.snakeCase()}}/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_repository_impl.dart';
import '../../features/{{module.snakeCase()}}/{{name.snakeCase()}}/domain/facades/{{name.snakeCase()}}_use_cases_facade.dart';
import '../../features/{{module.snakeCase()}}/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../../features/{{module.snakeCase()}}/{{name.snakeCase()}}/domain/usecases/{{name.snakeCase()}}/{{name.snakeCase()}}_usecase.dart';
import '../../features/{{module.snakeCase()}}/{{name.snakeCase()}}/presentation/blocs/{{name.snakeCase()}}_bloc.dart';

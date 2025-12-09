import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../domain/entities/base_entity.dart';
import '../../../../domain/entities/{{module.snakeCase()}}/{{name.snakeCase()}}_entity.dart';
import '../../../../domain/response/api_response.dart';
import '../../../../domain/usecase/{{module.snakeCase()}}/{{name.snakeCase()}}_use_case.dart';
import '../../../../utils/utils.dart';

import '../{{name.snakeCase()}}_initial_params.dart';

part '{{name.snakeCase()}}_event.dart';
part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  final {{name.pascalCase()}}InitialParams _initialParams;
  {{name.pascalCase()}}Bloc(this._initialParams)
      : super({{name.pascalCase()}}State(initialParams: _initialParams)) {
    on<SubmitActionEvent>(_submitAction);
  }

  Future<void> _submitAction(
      SubmitActionEvent event, Emitter<{{name.pascalCase()}}State> emit) async {
   
  }
}

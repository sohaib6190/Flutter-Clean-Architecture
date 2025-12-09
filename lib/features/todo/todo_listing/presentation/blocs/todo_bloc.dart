import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/facades/todo_use_cases_facade.dart';
import 'todo_event.dart';
import 'todo_state.dart';

EventTransformer<E> restartableDebounce<E>(
  Duration d,
  bool Function(E event) shouldDebounce,
) {
  return (events, mapper) {
    return events.switchMap((event) {
      if (shouldDebounce(event)) {
        return Rx.timer(event, d).switchMap(mapper);
      } else {
        return mapper(event);
      }
    });
  };
}

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoUseCasesFacade usecases;

  TodoBloc({required this.usecases})
    : super(TodoStateInitial());
}

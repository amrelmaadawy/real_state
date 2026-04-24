import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/core/error/error_mapper.dart';
import 'base_state.dart';

abstract class BaseBloc<Event, T> extends Bloc<Event, BaseState<T>> {
  BaseBloc() : super(BaseInitial<T>());

  Future<void> executeEmitter(
    Future<T> Function() action,
    Emitter<BaseState<T>> emit,
  ) async {
    emit(BaseLoading<T>());
    try {
      final result = await action();
      emit(BaseSuccess<T>(result));
    } catch (e) {
      final failure = ErrorMapper.mapExceptionToFailure(e);
      emit(BaseError<T>(failure));
    }
  }
}

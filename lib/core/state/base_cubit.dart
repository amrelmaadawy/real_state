import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_state/core/error/error_mapper.dart';
import 'base_state.dart';

abstract class BaseCubit<T> extends Cubit<BaseState<T>> {
  BaseCubit() : super(BaseInitial<T>());

  Future<void> execute(Future<T> Function() action) async {
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

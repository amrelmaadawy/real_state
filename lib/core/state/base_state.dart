import 'package:equatable/equatable.dart';
import 'package:real_state/core/error/failures.dart';

sealed class BaseState<T> extends Equatable {
  const BaseState();

  @override
  List<Object?> get props => [];
}

class BaseInitial<T> extends BaseState<T> {
  const BaseInitial();
}

class BaseLoading<T> extends BaseState<T> {
  const BaseLoading();
}

class BaseSuccess<T> extends BaseState<T> {
  final T data;

  const BaseSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

class BaseError<T> extends BaseState<T> {
  final Failure failure;

  const BaseError(this.failure);

  @override
  List<Object?> get props => [failure];
}

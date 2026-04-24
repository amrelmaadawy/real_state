import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import '../error/failures.dart';

/// Base UseCase interface for executing business logic.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Represents a UseCase that does not require any parameters.
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

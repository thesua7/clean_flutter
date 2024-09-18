import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class GeneralFailure extends Failure {
  final String message;

  GeneralFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class NetworkFailure extends Failure {
  final String message;

  NetworkFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  final String message;

  CacheFailure(this.message);

  @override
  List<Object?> get props => [message];
}





import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable
{
  final String message;

  const Failure({required this.message});

}


class ServerFailure extends Failure
{
  ServerFailure({required super.message});

  @override
  List<Object?> get props => [];

}

class EmptyCacheFailure extends Failure {
  EmptyCacheFailure({required super.message});

  @override
  List<Object?> get props => [];
}


class NetworkFailure extends Failure {

  NetworkFailure({required super.message});
  @override
  List<Object?> get props => [];
}
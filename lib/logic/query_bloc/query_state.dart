part of 'query_bloc.dart';

@immutable
abstract class QueryState {}

class QueryInitial extends QueryState {}

class QuerySuccess extends QueryState {
  final String message;
  QuerySuccess({required this.message});
}

class QueryLoading extends QueryState {}

class QueryFailure extends QueryState {
  final String message;
  QueryFailure({required this.message});
}

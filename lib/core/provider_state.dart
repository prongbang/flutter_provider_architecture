import 'package:meta/meta.dart';

// enum ProviderState {
//   Idle,
//   Loading,
//   Success,
//   Warning,
//   Timeout,
//   Error,
//   Unauthorized
// }

abstract class ProviderState {}

class Idle extends ProviderState {}

class Loading extends ProviderState {}

class Success extends ProviderState {}

class Error extends ProviderState {
  final String data;

  Error(this.data);
}

class MyState {
  MyState._();

  factory MyState.success(String foo) = SuccessState;

  factory MyState.error(String foo) = ErrorState;
}

class ErrorState extends MyState {
  ErrorState(this.msg) : super._();

  final String msg;
}

class SuccessState extends MyState {
  SuccessState(this.value) : super._();

  final String value;
}

@sealed
class Result<T> {}

// class Success<T> extends Result<T> {
//   final T value;
//
//   Success(this.value);
// }
//
// class Error<T> extends Result<T> {
//   final Exception exception;
//
//   Error(this.exception);
// }

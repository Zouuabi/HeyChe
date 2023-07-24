part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {}

class TextFieldEmpty extends LoginState {
  final String status; 

  const TextFieldEmpty({required this.status});
}

class LoginError extends LoginState {
  final String message;

  const LoginError({required this.message});
  @override
  List<Object> get props => [message];
}

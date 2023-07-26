part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterComplete extends RegisterState {}

class RegisterError extends RegisterState {
  final String message;

  const RegisterError({required this.message});
}

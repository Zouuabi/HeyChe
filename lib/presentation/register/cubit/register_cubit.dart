import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import 'package:flutter/material.dart' show TextEditingController;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/failure/failure.dart';
import '../../../domain/use_cases/register_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerUseCase) : super(RegisterInitial());
  final RegisterUseCase _registerUseCase;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Uint8List? photofile;

  TextEditingController get usernameController => _usernameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get bioController => _bioController;
  TextEditingController get passwordController => _passwordController;

  Future<void> register() async {
    emit(RegisterLoading());

    Either<Failure, void> result = await _registerUseCase.execute(
      RegisterUseCaseInput(
        bio: _bioController.text,
        email: _emailController.text,
        password: _passwordController.text,
        photofile: photofile,
        username: _usernameController.text,
      ),
    );

    emit(result.fold(
      (failure) => RegisterError(message: failure.failureMessage),
      (userCred) => RegisterComplete(),
    ));
  }
}

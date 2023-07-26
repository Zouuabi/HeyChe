import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import 'package:social_media_app/core/failure/failure.dart';
import 'package:social_media_app/domain/repositories/repository.dart';
import 'package:social_media_app/domain/use_cases/base_use_case.dart';

class RegisterUseCase implements BaseUseCase<RegisterUseCaseInput, void> {
  RegisterUseCase(this._repository);

  final Repository _repository;
  @override
  Future<Either<Failure, void>> execute(RegisterUseCaseInput input) async {
    return await _repository.register(
      username: input.username,
      email: input.email,
      password: input.password,
      photofile: input.photofile,
      bio: input.bio,
    );
  }
}

class RegisterUseCaseInput {
  RegisterUseCaseInput(
      {required this.username,
      required this.email,
      required this.password,
      required this.photofile,
      required this.bio});

  final String username;
  final String email;
  final String password;
  final Uint8List? photofile;
  final String bio;
}

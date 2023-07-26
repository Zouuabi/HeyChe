import 'package:dartz/dartz.dart';

import 'package:social_media_app/core/failure/failure.dart';
import 'package:social_media_app/domain/repositories/repository.dart';
import 'package:social_media_app/domain/use_cases/base_use_case.dart';

class LoginUseCaseInput {
  final String email;
  final String password;

  LoginUseCaseInput({required this.email, required this.password});
}

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, void> {
  LoginUseCase(this._repository);
  final Repository _repository;

  @override
  Future<Either<Failure, void>> execute(LoginUseCaseInput input) async {
    return await _repository.login(input.email, input.password);
  }
}

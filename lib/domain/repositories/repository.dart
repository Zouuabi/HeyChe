import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../core/failure/failure.dart';

abstract class Repository {
  Future<Either<Failure, void>> login(String email, String password);
  Future<Either<Failure, void>> register(
      {required String username,
      required String email,
      required String password,
      required Uint8List? photofile,
      required String bio});
}

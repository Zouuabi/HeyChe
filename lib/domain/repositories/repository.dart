import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' show UserCredential;

import '../../core/failure/failure.dart';

abstract class Repository {
  Future<Either<Failure, UserCredential>> login(String email , String password);
  Future<Either<Failure, UserCredential>> register();
}

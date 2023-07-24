import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' show UserCredential;

import 'package:social_media_app/core/failure/failure.dart';
import 'package:social_media_app/data/data_source/remote_data_source/cloud_firestore.dart';
import 'package:social_media_app/data/data_source/remote_data_source/cloud_storage.dart';
import 'package:social_media_app/data/data_source/remote_data_source/firebase_auth.dart';

import '../../core/failure/error_handler.dart';
import '../../core/network_info.dart';
import '../../domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  final NetworkInfo _networkInfo;
  final FirebaseAuthentication _auth;
  // ignore: unused_field
  final CloudStorage _cloudStorage;
  final CloudFirestore _cloudFirestore;

  RepositoryImpl(
      this._networkInfo, this._auth, this._cloudStorage, this._cloudFirestore);

  @override
  Future<Either<Failure, UserCredential>> login(
      String email, String password) async {
    if (await _networkInfo.isConnected) {
      try {
        UserCredential userCredential =
            await _auth.singInUser(email: email, password: password);

        await _cloudFirestore.setUserActive(userCredential.user!.uid);

        return Right(userCredential);
      } catch (error) {
        return Left(ErrorHandler.handle(error));
      }
    } else {
      return Left(Failure(failureMessage: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> register() {
    throw Error();
  }
}

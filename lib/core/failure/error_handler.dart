import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;

import 'failure.dart';

class ErrorHandler implements Exception {
  static Failure handle(dynamic error) {
    if (error is FirebaseAuthException) {
      // for signing
      switch (error.code) {
        case 'invalid-email':
          return Failure(failureMessage: 'Invalid Email');
        case 'wrong-password':
          return Failure(failureMessage: 'Wrong Password');
        case 'user-not-found':
          return Failure(failureMessage: 'User Not Found');
        case 'user-disabled':
          return Failure(failureMessage: 'Blocked User');

        // for registration
        case 'email-already-in-use':
          return Failure(
              failureMessage: 'Email adress associated to another account');
        case 'operation-not-allowed':
          return Failure(
              failureMessage: 'Opps you are not allowed to do that ');
        case 'weak-password':
          return Failure(failureMessage: 'Make your password stronger');
        default:
          return Failure(failureMessage: 'Something went wrong');
      }
    } else {
      return Failure(failureMessage: 'Something went wrong');
    }
  }
}

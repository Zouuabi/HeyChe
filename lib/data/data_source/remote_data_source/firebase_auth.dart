import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream< User ?> get user => _auth.userChanges();

  /// after getting the user cred
  /// must be mapped to [User] object
  Future<UserCredential> singInUser(
          {required String email, required String password}) =>
      _auth.signInWithEmailAndPassword(email: email, password: password);

  Future<UserCredential> registerUser({
    required String email,
    required String password,
  }) async {
    UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    return cred;
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}

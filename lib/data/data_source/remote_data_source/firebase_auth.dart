import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:social_media_app/data/data_source/remote_data_source/cloud_storage.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> singInUser(
          {required String email, required String password}) =>
      _auth.signInWithEmailAndPassword(email: email, password: password);

  Future<String> registerUser({
    required String username,
    required String email,
    required String password,
    required String bio,
    Uint8List? file,
  }) async {
    String status;
    try {
      // creating user account with Email and Password
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      String photoUrl = '';
      // if the user selected an image we upload it the storage
      
      // TODO : this must be implemented in the repository implementation
      if (file != null) {
        photoUrl = await CloudStorage()
            .uploadImageToStorage('profilePics', file, false);
      }

      status = 'Success';
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'invalid-email') {
      //   status = 'A samir yehdik rabi l\'email yabda hakka \n monji@gmail.com';
      // } else if (e.code == 'weak_password') {
      //   status = 'Chnya tw qawi mot de pass mte3k zooz markhoufin yeeser raw';
      // } else if (e.code == 'email-already-in-use') {
      //   status = 'emai mosta3ml chouf wehd akher';
      // } else {
      //   // status = 'famma mochkl ya3rfou ken rabi sobhanou ';
      //   status = e.message.
      // }
      status = e.message.toString();
    }
    return status;
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}

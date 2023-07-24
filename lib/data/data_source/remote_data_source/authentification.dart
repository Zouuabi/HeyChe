import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:social_media_app/data/data_source/remote_data_source/storage.dart';


class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //****************************************************************** */

  //! should in firestore file not auth
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    User? currentUser = _auth.currentUser;

    DocumentSnapshot<Map<String, dynamic>> snap =
        await _firestore.collection('users').doc(currentUser!.uid).get();
    return snap;
  }

  //************************************************* */

  Future<String> singInUser(
      {required String email, required String password}) async {
    String status;
    try {
      if (email.isNotEmpty & password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        // set the is active field to true
        await _firestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .update({'isActive': true});

        status = 'Success';
      } else {
        status = "dakhel adress w mot de pass makhyeb rasek ";
      }
    } on FirebaseAuthException catch (e) {
      status = e.message.toString();
    }

    return status;
  }

  Future<String> signUpUser({
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
      if (file != null) {
        photoUrl =
            await Storage().uploadImageToStorage('profilePics', file, false);
      }

      String uid = cred.user!.uid;
      await _firestore.collection('users').doc(uid).set({
        'username': username,
        'uid': uid,
        'email': email,
        'bio': bio,
        'followers': [],
        'following': [],
        'profileUrl': photoUrl,
        'isActive': false
      });

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

  Future<void> signUserOut() async {
    await _auth.signOut();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestore {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // User? currentUser = _auth.currentUser;

  Future<void> setUserActive(String uid) =>
      _firestore.collection('users').doc(uid).update({'isActive': true});

  void setUserInactive(String uid) async {
    
    await _firestore.collection('users').doc(uid).update({'isActive': false});
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails(
      String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snap =
        await _firestore.collection('users').doc(uid).get();
    return snap;
  }
  
  Future<void> registerNewUserInfo(
      {required String username,
      required String email,
      required String uid,
      required String bio,
      required String photoUrl}) async {
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
  }


  
}

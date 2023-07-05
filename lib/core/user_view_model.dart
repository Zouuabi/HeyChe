import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:social_media_app/data/authentification.dart';
import 'package:social_media_app/domain/model/user.dart';

class UserViewModel with ChangeNotifier {
  UserViewModel() {
    getUserInfoFromFirebase();
  }
  final Auth _auth = Auth();
  bool isActive = false;

  User? _user;

  void signeIn() {}
  User userInfo() => _user!;
  Map<String, dynamic> tojson({required User user}) {
    return {
      'username': user.username,
      'uid': user.uid,
      'email': user.email,
      'bio': user.bio,
      'followers': user.followers,
      'following': user.following,
      'profileUrl': user.profileUrl,
      'isActive': user.isActive,
    };
  }

  User fromJson({required DocumentSnapshot<Map<String, dynamic>> json}) {
    return User(
        uid: json['uid'],
        username: json['username'],
        email: json['email'],
        bio: json["bio"],
        profileUrl: json["profileUrl"],
        followers: json["followers"],
        following: json["following"],
        isActive: json["isActive"]);
  }

  Future<User> getUserInfoFromFirebase() async {
    DocumentSnapshot<Map<String, dynamic>> user = await _auth.getUserDetails();

    _user = fromJson(json: user);
    notifyListeners();
    return _user!;
  }

  void signOut() async {
    await _auth.signUserOut();
  }
}

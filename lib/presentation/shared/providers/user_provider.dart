// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:social_media_app/data/data_source/remote_data_source/firebase_auth.dart';
import 'package:social_media_app/domain/entites/user.dart';

@Deprecated("Bloc pattern must be used instead")
class UserProvider with ChangeNotifier {
  UserProvider() {
    // getUserInfoFromFirebase();
  }
  final FirebaseAuthentication _auth = FirebaseAuthentication();
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

  // Future<User> getUserInfoFromFirebase() async {
  //   DocumentSnapshot<Map<String, dynamic>> data =
  //       await FirestoreDatabase(uid: _user!.uid).getUserDetails();

  //   var user = data;
  //   _user = fromJson(json: user);
  //   notifyListeners();
  //   return _user!;
  // }

  // void signOut() async {
  //   await _auth.logOut();
  // }
}

// class UserProvider extends ChangeNotifier {
//   User? _user;
//   bool _isLoading = false;

//   User? get user => _user;
//   bool get isLoading => _isLoading;

//   Future<void> fetchUserDetails() async {
//     try {
//       _isLoading = true;
//       notifyListeners();

//       User? currentUser = _auth.currentUser;
//       DocumentSnapshot<Map<String, dynamic>> snap =
//           await _firestore.collection('users').doc(currentUser!.uid).get();
//       _user = User.fromSnapshot(snap);

//       _isLoading = false;
//       notifyListeners();
//     } catch (error) {
//       // Handle any errors that occur during fetching user details
//       _isLoading = false;
//       notifyListeners();
//       throw error;
//     }
//   }
// }


// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final userProvider = Provider.of<UserProvider>(context);

//     return FutureBuilder(
//       future: userProvider.fetchUserDetails(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           // User details fetched successfully, display them
//           final user = userProvider.user;

//           return Column(
//             children: [
//               Text('Username: ${user.name}'),
//               Text('Followers: ${user.followers.toString()}'),
//             ],
//           );
//         }
//       },
//     );
//   }
// }


/// [fdf ]fds sdf d fdfsd "dsfds " 'fdsf' @sdfds [Class] 
/// 
// class UserProvider extends ChangeNotifier {
//   Stream<User> getUserDetails() {
//     User? currentUser = _auth.currentUser;
//     Stream<DocumentSnapshot<Map<String, dynamic>>> userSnapshotStream =
//         _firestore.collection('users').doc(currentUser!.uid).snapshots();

//     return userSnapshotStream.map((snapshot) => User.fromSnapshot(snapshot));
//   }
// }


// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User>(
//       stream: Provider.of<UserProvider>(context).getUserDetails(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           final user = snapshot.data!;

//           return Column(
//             children: [
//               Text('Username: ${user.name}'),
//               Text('Followers: ${user.followers.toString()}'),
//             ],
//           );
//         }
//       },
//     );
//   }
// }

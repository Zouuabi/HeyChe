class User {
  const User({
    required this.username,
    required this.uid,
    required this.email,
    required this.bio,
    required this.profileUrl,
    required this.followers,
    required this.following,
  });
  final String username;
  final String uid;
  final String email;
  final String bio;
  final String profileUrl;
  final List followers;
  final List following;

  Map<String, dynamic> getUserInfo() {
    return {
      'username': username,
      'uid': uid,
      'email': email,
      'bio': bio,
      'followers': followers,
      'following': following,
      'profileUrl': profileUrl
    };
  }
}

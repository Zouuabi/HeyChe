class User {
  const User({
    required this.username,
    required this.uid,
    required this.email,
    required this.bio,
    required this.profileUrl,
    required this.followers,
    required this.following,
    required this.isActive,
  });
  final String username;
  final String uid;
  final String email;
  final String bio;
  final String profileUrl;
  final List followers;
  final List following;
  final bool isActive ; 
}

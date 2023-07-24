import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
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
  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'uid')
  final String? uid;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'bio')
  final String? bio;

  @JsonKey(name: 'profileUrl')
  final String? profileUrl;

  @JsonKey(name: 'followers')
  final List? followers;

  @JsonKey(name: 'following')
  final List? following;

  @JsonKey(name: 'isActive')
  final bool? isActive;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}

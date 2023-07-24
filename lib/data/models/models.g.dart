// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String?,
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      bio: json['bio'] as String?,
      profileUrl: json['profileUrl'] as String?,
      followers: json['followers'] as List<dynamic>?,
      following: json['following'] as List<dynamic>?,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'uid': instance.uid,
      'email': instance.email,
      'bio': instance.bio,
      'profileUrl': instance.profileUrl,
      'followers': instance.followers,
      'following': instance.following,
      'isActive': instance.isActive,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$GithubUserFromJson(Map<String, dynamic> json) {
  return User(
    json['login'] as String,
    json['id'] as int,
    json['avatar_url'] as String,
  );
}

Map<String, dynamic> _$GithubUserToJson(User instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'avatar_url': instance.avatarUrl,
    };

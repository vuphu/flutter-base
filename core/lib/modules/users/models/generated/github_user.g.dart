// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../github_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubUser _$GithubUserFromJson(Map<String, dynamic> json) {
  return GithubUser(
    json['login'] as String,
    json['id'] as int,
    json['avatar_url'] as String,
  );
}

Map<String, dynamic> _$GithubUserToJson(GithubUser instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'avatar_url': instance.avatarUrl,
    };

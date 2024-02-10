import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String login;
  final int id;
  @JsonKey(name: "avatar_url")
  final String avatarUrl;

  User(this.login, this.id, this.avatarUrl);

  factory User.fromJson(Map<String, dynamic> json) =>
      _$GithubUserFromJson(json);

  Map<String, dynamic> toJson() => _$GithubUserToJson(this);

  @override
  List<Object> get props => [id];
}

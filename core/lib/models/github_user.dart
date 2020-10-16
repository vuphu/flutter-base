import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/github_user.g.dart';

@JsonSerializable()
class GithubUser extends Equatable{
  final String login;
  final int id;
  @JsonKey(name: "avatar_url")
  final String avatarUrl;

  GithubUser(this.login, this.id, this.avatarUrl);

  factory GithubUser.fromJson(Map<String, dynamic> json) =>
      _$GithubUserFromJson(json);

  Map<String, dynamic> toJson() => _$GithubUserToJson(this);

  @override
  List<Object> get props => [id];
}

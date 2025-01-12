class UserResponse {
  final String login;
  final int id;
  final String avatarUrl;

  UserResponse(this.login, this.id, this.avatarUrl);

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      json['login'] as String,
      json['id'] as int,
      json['avatar_url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'login': this.login,
      'id': this.id,
      'avatar_url': this.avatarUrl,
    };
  }
}

import 'dart:convert';

import 'package:core/models/github_user.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class GithubUserAPI {
  Future<List<GithubUser>> getGithubUsers(int offset, int limit);
}

@Singleton(as: GithubUserAPI)
class GithubUserAPIImpl implements GithubUserAPI {
  @override
  Future<List<GithubUser>> getGithubUsers(int offset, int limit) async {
    final response = await http.get(
        "https://api.github.com/users?per_page=$limit&page=${offset / limit}");
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List).map((it) => GithubUser.fromJson(it)).toList();
    }
    return Future.error("");
  }
}

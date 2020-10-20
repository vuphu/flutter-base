import 'dart:convert';

import 'package:core/models/github_user.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class GithubUserAPI {
  Future<List<GithubUser>> getGithubUsers(String query, int offset, int limit);
}

@Singleton(as: GithubUserAPI)
class GithubUserAPIImpl implements GithubUserAPI {
  @override
  Future<List<GithubUser>> getGithubUsers(String query, int offset, int limit) async {
    final response = await http.get(
        "https://api.github.com/search/users?q=$query&per_page=$limit&page=${1 + offset ~/ limit}");
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['items'] as List).map((it) => GithubUser.fromJson(it)).toList();
    }
    return Future.error("Some things went wrong");
  }
}

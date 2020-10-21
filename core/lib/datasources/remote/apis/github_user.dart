import 'dart:convert';

import 'package:core/datasources/remote/rest/rest_api.dart';
import 'package:core/models/github_user.dart';
import 'package:http/http.dart' as http;
import 'package:core/datasources/remote/rest/endpoints.dart' as endpoints;
import 'package:injectable/injectable.dart';

abstract class GithubUserAPI {
  Future<List<GithubUser>> getGithubUsers(String query, int offset, int limit);
}

@Singleton(as: GithubUserAPI)
class GithubUserAPIImpl implements GithubUserAPI {
  @override
  Future<List<GithubUser>> getGithubUsers(String query, int offset, int limit) async {
    final response = await RestAPI().get(endpoints.searchGithubUsers, {
      "q": query,
      "per_page": limit,
      "page": 1 + offset ~/ limit
    });
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['items'] as List).map((it) => GithubUser.fromJson(it)).toList();
    }
    return Future.error("Some things went wrong");
  }
}

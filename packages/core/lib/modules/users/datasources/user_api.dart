import 'dart:convert';

import 'package:core/common/utils/rest_api.dart';
import 'package:injectable/injectable.dart';

import '../constants/endpoints.dart';
import '../dtos/responses/user_response.dart';

abstract class UserAPI {
  Future<List<UserResponse>> getGithubUsers(String query, int offset, int limit);
}

@Singleton(as: UserAPI)
class UserAPIImpl extends UserAPI {
  @override
  Future<List<UserResponse>> getGithubUsers(String query, int offset, int limit) async {
    final response =
        await RestAPI().get(searchGithubUsers, {"q": query, "per_page": limit, "page": 1 + offset ~/ limit});

    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['items'] as List<dynamic>).map((it) => UserResponse.fromJson(it)).toList();
    }

    return Future.error("Some things went wrong");
  }
}

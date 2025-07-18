import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../common/helpers.dart';
import '../constants/endpoints.dart';
import '../dtos/requests/search_users_request.dart';
import '../dtos/responses/pagination_response.dart';
import '../dtos/responses/user_response.dart';

abstract class GithubAPI {
  Future<PaginationResponse<UserResponse>> searchUsers(SearchUsersRequest request);
}

@Singleton(as: GithubAPI)
class GithubAPIImpl extends GithubAPI {
  @override
  Future<PaginationResponse<UserResponse>> searchUsers(SearchUsersRequest request) async {
    final response = await RestAPI()
        .setEndpoint("${kGithubEndpoint}/search/users")
        .setQueries({"q": request.q, "per_page": request.perPage, "page": request.page}).get();

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return PaginationResponse.fromJson(json, UserResponse.fromJson);
    }

    return Future.error("Some things went wrong");
  }
}

import 'package:core/modules/github/dtos/requests/search_users_request.dart';
import 'package:injectable/injectable.dart';

import '../datasources/datasources.dart';
import '../dtos/responses/pagination_response.dart';
import '../dtos/responses/user_response.dart';

abstract class GithubService {
  Future<PaginationResponse<UserResponse>> searchUsers(SearchUsersRequest request);
}

@Singleton(as: GithubService)
class GithubServiceImpl implements GithubService {
  final GithubAPI _api;

  GithubServiceImpl(GithubAPI api) : _api = api;

  @override
  Future<PaginationResponse<UserResponse>> searchUsers(SearchUsersRequest request) {
    return _api.searchUsers(request);
  }
}

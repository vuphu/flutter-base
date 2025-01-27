import 'package:core/modules/users/datasources/user_api.dart';
import 'package:injectable/injectable.dart';

import '../dtos/responses/user_response.dart';

abstract class UserService {
  Future<List<UserResponse>> getGithubUsers(String query, int offset, int limit);
}

@Singleton(as: UserService)
class UserServiceImpl implements UserService {
  final UserAPI _api;

  UserServiceImpl(UserAPI api) : _api = api;

  @override
  Future<List<UserResponse>> getGithubUsers(String query, int offset, int limit) {
    return _api.getGithubUsers(query, offset, limit);
  }
}

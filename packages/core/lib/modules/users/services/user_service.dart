import 'package:core/modules/users/datasources/user_api.dart';
import 'package:injectable/injectable.dart';

import '../models/user.dart';

abstract class UserService {
  Future<List<User>> getGithubUsers(String query, int offset, int limit);
}

@Singleton(as: UserService)
class UserServiceImpl implements UserService {
  final UserAPI _api;

  UserServiceImpl(UserAPI api) : _api = api;

  @override
  Future<List<User>> getGithubUsers(String query, int offset, int limit) {
    return _api.getGithubUsers(query, offset, limit);
  }
}

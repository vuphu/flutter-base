import 'package:core/datasources/remote/rest/apis/github_user_api.dart';
import 'package:core/models/github_user.dart';
import 'package:injectable/injectable.dart';

abstract class Repository {
  Future<List<GithubUser>> getGithubUsers(String query, int offset, int limit);
}

@Singleton(as: Repository)
class RepositoryImpl implements Repository {
  final GithubUserAPI githubUserAPI;

  RepositoryImpl(this.githubUserAPI);

  @override
  Future<List<GithubUser>> getGithubUsers(String query, int offset, int limit) {
    return githubUserAPI.getGithubUsers(query, offset, limit);
  }
}

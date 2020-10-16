import 'package:core/models/github_user.dart';
import 'package:core/repositories/repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoadGithubUserAction {
  final Repository repository;

  LoadGithubUserAction(this.repository);

  Future<List<GithubUser>> execute(int offset, int limit) {
    return repository.getGithubUsers(offset, limit);
  }
}

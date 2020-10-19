import 'package:core/models/github_user.dart';
import 'package:core/repositories/repository.dart';
import 'package:injectable/injectable.dart';
import 'package:core/config/constants/constants.dart' as constants;

abstract class LoadGithubUserAction {
  Future<List<GithubUser>> execute({int offset, int limit});
}

@LazySingleton(as: LoadGithubUserAction)
class LoadGithubUserActionImpl implements LoadGithubUserAction {
  final Repository repository;

  LoadGithubUserActionImpl(this.repository);

  @override
  Future<List<GithubUser>> execute({int offset = 0, int limit = constants.Limit.thread}) {
    return repository.getGithubUsers(offset, limit);
  }
}
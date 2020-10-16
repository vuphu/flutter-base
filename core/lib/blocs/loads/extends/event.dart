import 'package:core/action/load_github_user.dart';
import 'package:core/blocs/loads/base/event.dart';
import 'package:core/blocs/loads/base/state.dart';
import 'package:core/blocs/loads/extends/state.dart';
import 'package:core/config/constants/constants.dart' as constants;
import 'package:core/di/di.dart';
import 'package:core/models/github_user.dart';

class LoadingGithubUsersEvent extends LoadingEvent<GithubUser> {
  final int offset;
  final int limit;

  LoadingGithubUsersEvent(
      {this.offset = 0, this.limit = constants.Limit.thread});

  @override
  Future<LoadState> mapEventToState() async {
    var data = await getIt.get<LoadGithubUserAction>().execute(offset, limit);
    return LoadGithubUserSuccessState(data);
  }
}

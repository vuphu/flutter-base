import 'package:core/blocs/loads/base/state.dart';
import 'package:core/models/github_user.dart';

class LoadGithubUserSuccessState extends LoadSuccessState<GithubUser> {
  LoadGithubUserSuccessState(List<GithubUser> data) : super(data);
}

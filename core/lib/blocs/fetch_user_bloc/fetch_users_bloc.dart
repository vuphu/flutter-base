import 'package:core/base/blocs.dart';
import 'package:core/base/presenter.dart';
import 'package:core/config/constants/limit.dart';
import 'package:core/di/di.dart';
import 'package:core/domain/models/github_user.dart';
import 'package:core/domain/repositories/repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: FetchUserBloc)
class FetchUserBloc extends BaseBloc with SingleBlocMixin {
  final Repository _repository;

  FetchUserBloc(Repository repository) : _repository = repository;

  void fetch(String query, int offset) {
    single<List<GithubUser>>(
      () => _repository.getGithubUsers(query, offset, Limit.NUMBER_OF_RECORDS),
      onSuccess: (data) => DataChangedState(data),
    );
  }
}

mixin FetchUserMixin on BasePresenter {
  late FetchUserBloc _fetchUserBloc;

  @override
  void onStart() {
    super.onStart();
    _fetchUserBloc = getIt<FetchUserBloc>();
  }

  @override
  void onDestroy() {
    super.onDestroy();
    _fetchUserBloc.close();
  }

  FetchUserBloc get fetchUserBloc => _fetchUserBloc;
}

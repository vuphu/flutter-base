import 'package:core/base/presenter.dart';
import 'package:core/di/di.dart';
import 'package:core/modules/users/blocs/fetch_users_bloc.dart';

class HomePresenter extends BasePresenter {
  late FetchUserBloc fetchUserBloc;

  @override
  void onStart() {
    super.onStart();
    fetchUserBloc = getIt<FetchUserBloc>();
  }

  @override
  void onDestroy() {
    fetchUserBloc.close();
    super.onDestroy();
  }
}

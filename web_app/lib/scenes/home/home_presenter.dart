import 'package:core/base/presenter.dart';
import 'package:core/blocs/fetch_user_bloc/fetch_users_bloc.dart';

class HomePresenter extends BasePresenter with FetchUserMixin {}

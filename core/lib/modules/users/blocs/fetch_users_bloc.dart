import 'package:core/base/blocs.dart';
import 'package:core/config/constants/limit.dart';
import 'package:core/modules/users/services/user_service.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class FetchUserBloc extends BaseBloc with SingleBlocMixin {
  final UserService _service;

  FetchUserBloc(UserService service) : _service = service;

  void fetch(String query, int offset) {
    single(
      () => _service.getGithubUsers(query, offset, Limit.NUMBER_OF_RECORDS),
      onSuccess: (data) => DataChangedState(data),
    );
  }
}

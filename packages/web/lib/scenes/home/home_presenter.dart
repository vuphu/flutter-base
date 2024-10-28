import 'package:core/common/base/presenter.dart';
import 'package:core/config/constants/constants.dart';
import 'package:core/di/di.dart';
import 'package:core/modules/users/user_module.dart';
import 'package:flutter/widgets.dart';

class HomePresenter extends BasePresenter with WrapErrorMixin {
  late UserService _userService;

  late ValueNotifier<List<User>> usersNotifier;

  @override
  void onStart() {
    super.onStart();
    _userService = getIt<UserService>();
    usersNotifier = ValueNotifier([]);
  }

  @override
  void onDestroy() {
    super.onDestroy();
  }

  Future<void> fetchUsers(String query, int currentPosition) async {
    await wrapError(
      () => _userService.getGithubUsers(
        query,
        currentPosition,
        Limit.NUMBER_OF_RECORDS,
      ),
      onSuccess: (data) => usersNotifier.value = data,
    );
  }
}

import 'package:core/common/mixins/presenter_mixin.dart';
import 'package:core/di/di.dart';
import 'package:core/modules/github/github_module.dart';
import 'package:core/packages/view_models/view_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/constants/constants.dart';

class HomePresenter extends BasePresenter with RiverpodExecution, PresenterMixin {
  final GithubService _githubService = getIt<GithubService>();

  final usersProvider =
      StateProvider<AsyncValue<List<UserResponse>>>((ref) => AsyncValue.loading());

  Future<void> fetchUsers(String query, int currentPosition) async {
    SearchUsersRequest request = SearchUsersRequest(
      q: query,
      page: 1 + currentPosition ~/ kDefaultPageLimit,
      perPage: kDefaultPageLimit,
    );
    await execute(
      () async {
        final pagination = await _githubService.searchUsers(request);
        return pagination.items;
      },
      usersProvider,
      onError: (message) {
        print(message);
        toastError(message);
      },
    );
  }
}

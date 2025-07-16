import 'package:core/di/di.dart';
import 'package:core/modules/github.dart';
import 'package:core/packages/data_binder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/constants/constants.dart';

class HomePresenter extends DataBinder with RiverpodExecution, UIHandler {
  final GithubService _githubService = getIt<GithubService>();

  final usersCountProvider = StateProvider<int>((ref) => 0);
  final usersProvider = StateProvider<AsyncValue<PaginationResponse<UserResponse>>>(
    (ref) => AsyncValue.loading(),
  );

  Future<void> fetchUsers(String q, int page) async {
    SearchUsersRequest request = SearchUsersRequest(
      q: q,
      page: page,
      perPage: kDefaultPageLimit,
    );
    await execute(
      () async {
        final pagination = await _githubService.searchUsers(request);
        updateUsersCount(pagination.totalCount);
        return pagination;
      },
      usersProvider,
      onError: (message) {
        print(message);
        toastError(message);
      },
    );
  }

  void updateUsersCount(int totalCount) {
    ref!.read(usersCountProvider.notifier).state = totalCount;
  }
}

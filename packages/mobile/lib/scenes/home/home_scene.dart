import 'package:core/common/widgets/widgets.dart';
import 'package:core/modules/github/dtos/responses/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/constants/constants.dart';
import '../../common/widgets/pagination_view.dart';
import 'home_presenter.dart';
import 'widgets/widgets.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final PaginationViewController _paginationController = PaginationViewController();
  final HomePresenter _presenter = HomePresenter();
  final String _searchText = "vuphu";

  @override
  void initState() {
    super.initState();
    _presenter.onStart(context);
    _presenter.setRef(ref);
  }

  @override
  void dispose() {
    _presenter.onDestroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(_presenter.usersProvider, (_, next) {
      if (next.hasValue) {
        _paginationController.addItems(
          next.requireValue,
          isStopLoadMore: next.requireValue.length < kDefaultPageLimit,
        );
      }
    });

    return Scaffold(
      body: Center(
        child: PaginationView(
          onTap: (index, item) {
            // No-op
          },
          onLoad: (currentPosition) {
            _presenter.fetchUsers(_searchText, currentPosition);
          },
          blankDataView: BlankDataView(),
          onCreateView: (index, item) {
            if (item is UserResponse) {
              return UserWidget(user: item);
            }
            return Container();
          },
          controller: _paginationController,
          isAutoLoading: true,
        ),
      ),
    );
  }
}

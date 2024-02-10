import 'package:core/config/constants/limit.dart';
import 'package:core/modules/users/models/user.dart';
import 'package:core/widgets/blank_data_view.dart';
import 'package:core/widgets/pagination_view.dart';
import 'package:flutter/material.dart';
import 'package:web_app/widgets/user_widget.dart';

import 'home_presenter.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PaginationViewController _paginationController;
  late HomePresenter _homePresenter;

  @override
  void initState() {
    super.initState();
    _paginationController = PaginationViewController();
    _homePresenter = HomePresenter()..onStart();

    _homePresenter.usersNotifier.addListener(() {
      final users = _homePresenter.usersNotifier.value;
      _paginationController.addItems(
        users,
        isStopLoadMore: users.length < Limit.NUMBER_OF_RECORDS,
      );
    });
  }

  @override
  void dispose() {
    _homePresenter.onDestroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 500),
          child: PaginationView(
            onTap: (index, item) {
              // No-op
            },
            onLoad: (currentPosition) {
              _homePresenter.fetchUsers("vuphu", currentPosition);
            },
            blankDataView: BlankDataView(),
            onCreateView: (index, item) {
              if (item is User) {
                return UserWidget(data: item);
              }
              return Container();
            },
            controller: _paginationController,
            isAutoLoading: true,
          ),
        ),
      ),
    );
  }
}

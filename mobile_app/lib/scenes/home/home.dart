import 'package:core/base/blocs.dart';
import 'package:core/config/constants/limit.dart';
import 'package:core/modules/users/models/github_user.dart';
import 'package:core/widgets/blank_data_view.dart';
import 'package:core/widgets/pagination_view.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/scenes/home/home_presenter.dart';
import 'package:mobile_app/widgets/github_user.dart';

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

    _homePresenter.fetchUserBloc.stream.listen((state) {
      if (state is DataChangedState<List<GithubUser>>) {
        _paginationController.addItems(
          state.data,
          isStopLoadMore: state.data.length < Limit.NUMBER_OF_RECORDS,
        );
      }
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
      body: PaginationView(
        onTap: (index, item) {
          // No-op
        },
        onLoad: (currentPosition) {
          _homePresenter.fetchUserBloc.fetch("vuphu", currentPosition);
        },
        blankDataView: BlankDataView(),
        onCreateView: (index, item) {
          if (item is GithubUser) {
            return GithubUserWidget(data: item);
          }
          return Container();
        },
        controller: _paginationController,
        isAutoLoading: true,
      ),
    );
  }
}

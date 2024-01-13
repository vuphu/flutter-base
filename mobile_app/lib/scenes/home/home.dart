import 'package:core/base/blocs.dart';
import 'package:core/config/constants/limit.dart';
import 'package:core/modules/users/models/github_user.dart';
import 'package:core/widgets/blank_data_view.dart';
import 'package:core/widgets/pagination_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_app/scenes/home/home_presenter.dart';
import 'package:mobile_app/widgets/github_user.dart';

class HomePage extends ConsumerStatefulWidget {
  HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class CountNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increase() {
    state = state + 1;
  }
}

class _HomePageState extends ConsumerState<HomePage> {
  late PaginationViewController _paginationController;
  late HomePresenter _homePresenter;
  final counterProvider =
      NotifierProvider<CountNotifier, int>(CountNotifier.new);

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

    ref.read(counterProvider);
  }

  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          InkWell(
            child: Text('Click me'),
            onTap: () {
              ref.read(counterProvider.notifier).increase();
              print(counter);
            },
          ),
          Expanded(
            child: PaginationView(
              onTap: (index, item) {
                // No-op
              },
              onLoad: (currentPosition) {
                _homePresenter.fetchUserBloc.fetch("vuphu", currentPosition);
              },
              blankDataView: BlankDataView(),
              onCreateView: (index, item) {
                if (item is GithubUser) {
                  return Column(
                    children: [
                      Text(counter.toString()),
                      SizedBox(height: 10),
                      GithubUserWidget(data: item),
                    ],
                  );
                }
                return Container();
              },
              controller: _paginationController,
              isAutoLoading: true,
            ),
          ),
        ],
      ),
    );
  }
}

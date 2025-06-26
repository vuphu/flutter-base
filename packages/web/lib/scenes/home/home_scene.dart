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
  final HomePresenter _presenter = HomePresenter();
  final String _searchText = "vuphu";
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _presenter.onStart(context);
    _presenter.setRef(ref);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _presenter.fetchUsers(_searchText, _currentPage);
    });
  }

  @override
  void dispose() {
    _presenter.onDestroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ref
                .watch(_presenter.usersProvider)
                .when(
                  data:
                      (pagination) =>
                          SizedBox(width: 500, child: UsersTable(users: pagination.items)),
                  error: (_, __) => Center(child: const CircularProgressIndicator()),
                  loading: () => Center(child: const CircularProgressIndicator()),
                ),
          ),
          _buildPagination(ref.watch(_presenter.usersCountProvider)),
        ],
      ),
    );
  }

  Widget _buildPagination(int totalCount) {
    int pageRange = 3;
    int totalPages = 1 + totalCount ~/ kDefaultPageLimit;
    int startPage = (_currentPage - pageRange > 0) ? _currentPage - pageRange : 1;
    int endPage = (_currentPage + pageRange < totalPages) ? _currentPage + pageRange : totalPages;

    paginateProducts(int page) async {
      if (_currentPage == page) {
        return;
      }
      _currentPage = page;
      await _presenter.fetchUsers(_searchText, _currentPage);
    }

    return PaginationView(
      currentPage: _currentPage,
      startPage: startPage,
      endPage: endPage,
      totalPages: totalPages,
      onPageChanged: paginateProducts,
      primaryColor: Theme.of(context).primaryColor,
    );
  }
}

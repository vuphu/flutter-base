import 'package:core/blocs/render/render_bloc.dart';
import 'package:core/blocs/render/render_event.dart';
import 'package:core/blocs/render/render_state.dart';
import 'package:core/blocs/runnable/runnable_bloc.dart';
import 'package:core/blocs/runnable/runnable_event.dart';
import 'package:core/blocs/runnable/runnable_state.dart';
import 'package:core/di/di.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'items.dart';

class PaginationView<T> extends StatefulWidget {
  final Future<List<T>> Function(int currentPosition) pageFetch;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final void Function(String error) onError;
  final int loadingOffset;
  final bool isPullToRequest;

  PaginationView(
      {Key key,
      this.pageFetch,
      this.itemBuilder,
      this.onError,
      this.loadingOffset = 200,
      this.isPullToRequest = false})
      : super(key: key);

  @override
  _PaginationViewState<T> createState() => _PaginationViewState<T>();
}

class _PaginationViewState<T> extends State<PaginationView<T>> {
  RunnableBloc<List<T>> _runnableBloc = RunnableBloc<List<T>>();
  RenderBloc _renderBloc = getIt.get<RenderBloc>();

  List<T> _items = List();
  bool _isLoading = true;
  bool _isStop = false;

  @override
  void initState() {
    super.initState();
    _callFetch();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RunnableBloc<List<T>>, RunnableState>(
        cubit: _runnableBloc,
        listener: (context, state) {
          if (state is RunSuccessState<List<T>>) {
            if (state.data.isEmpty) {
              _isStop = true;
            }
            _items.addAll(state.data);
          }
          if (state is RunErrorState) {
            this.widget.onError(state.error);
          }
          _stopLoading();
        },
        child: BlocBuilder<RenderBloc, RenderState>(
          cubit: _renderBloc,
          builder: (context, state) {
            if (widget.isPullToRequest) {
              return RefreshIndicator(
                  child: _buildListView(),
                  onRefresh: () async {
                    _items.clear();
                    _isStop = false;
                    _callFetch();
                  });
            }
            return _buildListView();
          },
        ));
  }

  Widget _buildListView() {
    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (index < _items.length) {
          if (index == _items.length - 1 && !_isLoading &&
              !_isStop) {
            _callFetch();
          }
          return this.widget.itemBuilder(context, _items[index], index);
        }
        return LoadingItem().build();
      },
      itemCount: _isLoading ? 1 + _items.length : _items.length,
    );
  }

  _callFetch() {
    _runnableBloc..add(RunEvent(_pageFetch));
    _startLoading();
  }

  _startLoading() {
    _isLoading = true;
    _renderBloc..add(RenderEvent());
  }

  _stopLoading() {
    _isLoading = false;
    _renderBloc.add(RenderEvent());
  }

  Future<List<T>> _pageFetch() {
    return this.widget.pageFetch(_items.length);
  }
}

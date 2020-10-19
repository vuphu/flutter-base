import 'dart:ffi';

import 'package:core/blocs/render/render_bloc.dart';
import 'package:core/blocs/render/render_event.dart';
import 'package:core/blocs/render/render_state.dart';
import 'package:core/blocs/single_action/single_action_bloc.dart';
import 'package:core/blocs/single_action/single_action_event.dart';
import 'package:core/blocs/single_action/singlel_action_state.dart';
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

  PaginationView({Key key, this.pageFetch, this.itemBuilder, this.onError, this.loadingOffset = 200, this.isPullToRequest = false}) : super(key: key);

  @override
  _PaginationViewState<T> createState() => _PaginationViewState<T>();
}

class _PaginationViewState<T> extends State<PaginationView<T>> {
  SingleActionBloc<List<T>> _callActionBloc = SingleActionBloc<List<T>>();
  RenderBloc _renderListViewBloc = getIt.get<RenderBloc>();

  ScrollController _scrollController;

  List<T> _items = List();
  bool _isLoading = true;
  bool _isStop = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener((_onScroll));
    _callFetch();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SingleActionBloc, SingleActionState>(
      cubit: _callActionBloc,
      listener: (context, state) {
        if (state is SingleActionSuccessState) {
          if (state.data.isEmpty) {
            _isStop = true;
          }
          _items.addAll(state.data);
        }
        if (state is SingleActionErrorState) {
          this.widget.onError(state.error);
        }
        _stopLoading();
      },
      child: BlocBuilder<RenderBloc, RenderState>(
        cubit: _renderListViewBloc,
        builder: (context, state) {
          if (widget.isPullToRequest) {
            return RefreshIndicator(child: _buildListView(), onRefresh: () async {
              _items.clear();
              _callFetch();
            });
          }
          return _buildListView();
        },
      )
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: (context, index) {
        if (index < _items.length) {
          return this.widget.itemBuilder(context, _items[index], index);
        }
        return LoadingItem().build();
      },
      itemCount: _isLoading ? 1 + _items.length : _items.length,
    );
  }

  _callFetch() {
    _callActionBloc..add(SingleActionEvent(_pageFetch));
    _startLoading();
  }

  _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= this.widget.loadingOffset && !_isLoading && !_isStop) {
      _callFetch();
    }
  }

  Future<List<T>> _pageFetch() {
    return this.widget.pageFetch(_items.length);
  }

  _startLoading() {
    _isLoading = true;
    _renderListViewBloc..add(RenderEvent());
  }

  _stopLoading() {
    _isLoading = false;
    _renderListViewBloc.add(RenderEvent());
  }
}

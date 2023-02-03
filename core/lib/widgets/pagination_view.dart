import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginationView extends StatefulWidget {
  final Function(int index, dynamic item)? onTap;
  final Function(int currentPosition) onLoad;
  final Widget Function(int index, dynamic item) onCreateView;
  final Widget? blankDataView;
  final PaginationViewController controller;
  final bool isAutoLoading;

  const PaginationView({
    required this.onTap,
    required this.onLoad,
    required this.onCreateView,
    required this.controller,
    this.blankDataView,
    this.isAutoLoading = true,
  }) : super();

  @override
  State<StatefulWidget> createState() => _PaginationViewState();
}

class PaginationViewController extends Cubit<int> {
  PaginationViewController() : super(0);

  List _items = [];
  bool _isLoading = true;
  bool _isStopLoadMore = false;

  void addItems(List items, {bool? isStopLoadMore}) {
    _isLoading = false;
    _items.addAll(items);
    if (isStopLoadMore != null) {
      _isStopLoadMore = isStopLoadMore;
    }
    render();
  }

  void clearItems() {
    _items.clear();
    _isLoading = true;
    _isStopLoadMore = false;
    render();
  }

  void _loading() {
    _isLoading = true;
    render();
  }

  void render() => emit(state + 1);
}

class _PaginationViewState extends State<PaginationView> {
  @override
  void initState() {
    super.initState();
    if (widget.isAutoLoading) {
      this.widget.onLoad(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: widget.controller,
      builder: (context, state) => _buildListOfItems(),
    );
  }

  Widget _buildListOfItems() {
    List items = widget.controller._items;
    bool isLoading = widget.controller._isLoading;
    bool isStop = widget.controller._isStopLoadMore;

    if (items.isEmpty && !isLoading && isStop && widget.blankDataView != null) {
      return widget.blankDataView!;
    }

    return Scrollbar(
      thumbVisibility: true,
      trackVisibility: true,
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index < items.length) {
            return Card(
              child: InkWell(
                onTap: () => widget.onTap?.call(index, items[index]),
                child: widget.onCreateView(index, items[index]),
              ),
            );
          }
          return isLoading ? _buildLoading() : _buildShowMore();
        },
        itemCount: !isStop ? 1 + items.length : items.length,
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
      ),
    );
  }

  Widget _buildShowMore() {
    return Card(
      child: Container(
        height: 50,
        child: InkWell(
          onTap: () {
            this.widget.controller._loading();
            this.widget.onLoad(widget.controller._items.length);
          },
          child: Center(
            child: Text(
              "Hiển thị thêm",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

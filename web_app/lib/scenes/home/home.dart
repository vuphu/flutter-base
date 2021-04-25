import 'package:core/widgets/blank_data_view.dart';
import 'package:core/widgets/pagination_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 500,
        alignment: Alignment.center,
        child: PaginationView(
          onTap: (index, item) {
            // No-op
          },
          onLoad: (currentPosition) {
            // No-op
          },
          blankDataView: BlankDataView(),
          onCreateView: (index, item) {
            return Container();
          },
          controller: PaginationViewController(),
          isAutoLoading: false,
        ),
      ),
    );
  }
}

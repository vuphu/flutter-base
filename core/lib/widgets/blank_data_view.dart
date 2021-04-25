import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlankDataView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            child: Image.asset(
              "assets/empty_data.png",
              package: 'core',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Không có dữ liệu", style: Theme.of(context).textTheme.bodyText1)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
          Text("Empty data", style: Theme.of(context).textTheme.bodyMedium)
        ],
      ),
    );
  }
}

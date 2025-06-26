import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlankDataView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            child: SvgPicture.asset(
              "assets/images/empty_data.svg",
              package: 'core',
            ),
          ),
        ],
      ),
    );
  }
}

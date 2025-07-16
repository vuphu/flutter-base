import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class DataBinder {
  late BuildContext? context;

  void onStart(BuildContext context) {
    this.context = context;
  }

  void onDestroy() {
    this.context = null;
  }
}


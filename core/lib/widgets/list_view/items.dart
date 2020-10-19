import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class CustomItem {
  Widget build();
}

class LoadingItem extends CustomItem {
  @override
  Widget build() {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(4),
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}

class TitleItem extends CustomItem {
  final String title;

  TitleItem(this.title);

  @override
  Widget build() {
    return Text(this.title);
  }
}

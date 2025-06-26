import 'package:flutter/material.dart';

class ErrorToast extends StatefulWidget {
  final String message;

  const ErrorToast({Key? key, required this.message}) : super(key: key);

  @override
  _ErrorToastState createState() => _ErrorToastState();
}

class _ErrorToastState extends State<ErrorToast> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.message,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

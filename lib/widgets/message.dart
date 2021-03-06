import 'package:flutter/material.dart';
import 'package:statbuzz/themes/themes.dart';

class Message extends StatelessWidget {
  final String message;

  Message({this.message});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          message,
          style: messageTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

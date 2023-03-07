import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class TextError extends StatelessWidget {
  final String msg;
  Function onPressed;

  TextError({required this.msg, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          onPressed();
        },
        child: Text(
          msg,
          style: TextStyle(
            color: Colors.red,
            fontSize: 22,
          ),
        )

      ),
    );
  }
}

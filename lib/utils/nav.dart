import 'package:flutter/material.dart';

void push(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

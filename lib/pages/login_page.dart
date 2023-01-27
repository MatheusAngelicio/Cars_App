import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carros")),
      body: _body()
    );
  }

  _body() {
    Container(
      color: Colors.white,
    );
  }
}

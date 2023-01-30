import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Carros")), body: _body());
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          Text("Login"),
          TextFormField(),
          SizedBox(height: 10,),
          Text("Senha"),
          TextFormField(
            obscureText: true,
          ),
          SizedBox(height: 20,),
          Container(
            height: 46,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Login",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

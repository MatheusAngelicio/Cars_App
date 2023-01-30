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
          TextFormField(
            style: const TextStyle(
              fontSize: 25,
              color: Colors.blue
            ),
            decoration: const InputDecoration(
              labelText: "Login",
              labelStyle: TextStyle(
                fontSize: 25,
                color: Colors.grey
              ),
              hintText: "Digite o login",
              hintStyle: TextStyle(
                fontSize: 16
              )
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            obscureText: true,
            style: const TextStyle(
                fontSize: 25,
                color: Colors.blue
            ),
            decoration: const InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.grey
                ),
                hintText: "Digite a senha",
                hintStyle: TextStyle(
                    fontSize: 16
                )
            ),
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

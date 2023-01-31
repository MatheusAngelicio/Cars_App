import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Carros")), body: _body());
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          _text("Login", "Digite o login", controller: _tLogin),
          const SizedBox(height: 10,),
          _text("Senha", "Digite a senha", password: true, controller: _tSenha),
          const SizedBox(height: 20,),
          _button("Login", () => _onClickLogin),
        ],
      ),
    );
  }

  _text(String label, String hint, {bool password = false, required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      style: const TextStyle(fontSize: 25, color: Colors.blue),
      decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 25, color: Colors.grey),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 16)),
    );
  }

  _button(String text, Function onPressed) {
    return Container(
      height: 46,
      child: ElevatedButton(
        onPressed: onPressed(),
        child: Text(
          text,
        ),
      ),
    );
  }

  _onClickLogin() {
    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login $login, Senha $senha");
  }
}

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Carros")), body: _body());
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            _text("Login", "Digite o login",
                controller: _tLogin,
                validator: _validateLogin,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                nextFocus: _focusSenha),
            const SizedBox(
              height: 10,
            ),
            _text("Senha", "Digite a senha",
                password: true,
                controller: _tSenha,
                validator: _validateSenha,
                keyboardType: TextInputType.number,
                focusNode: _focusSenha),
            const SizedBox(
              height: 20,
            ),
            _button("Login", () => _onClickLogin),
          ],
        ),
      ),
    );
  }

  _text(String label, String hint,
      {bool password = false,
      required TextEditingController controller,
      FormFieldValidator<String>? validator,
      TextInputType? keyboardType,
      TextInputAction? textInputAction,
      FocusNode? focusNode,
      FocusNode? nextFocus}) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if(nextFocus != null) {
          FocusScope.of(context).requestFocus(_focusSenha);
        }
      },
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
    bool? formOk = _formKey.currentState?.validate();

    if (formOk == null || formOk == false) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login $login, Senha $senha");
  }

  String? _validateLogin(String? text) {
    if (text == null || text.isEmpty) {
      return "Digite o Login";
    }
    return null;
  }

  String? _validateSenha(String? text) {
    if (text == null || text.isEmpty) {
      return "Digite a senha";
    } else if (text.length < 3) {
      return "A senha precisa ter pelo menos 2 números";
    }
    return null;
  }
}

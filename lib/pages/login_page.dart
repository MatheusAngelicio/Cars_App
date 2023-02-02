import 'package:cars_app/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../utils/nav.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text.dart';

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
            AppText("Login", "Digite o login",
                controller: _tLogin,
                validator: _validateLogin,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                nextFocus: _focusSenha),
            const SizedBox(
              height: 10,
            ),
            AppText("Senha", "Digite a senha",
                password: true,
                controller: _tSenha,
                validator: _validateSenha,
                keyboardType: TextInputType.number,
                focusNode: _focusSenha),
            const SizedBox(
              height: 20,
            ),
            AppButton("Login", () => _onClickLogin),
          ],
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

    push(context, HomePage());
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

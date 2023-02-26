import 'dart:async';

import 'package:cars_app/pages/api_response.dart';
import 'package:cars_app/pages/carro/home_page.dart';
import 'package:cars_app/pages/login/login_api.dart';
import 'package:cars_app/pages/login/usuario.dart';
import 'package:cars_app/utils/alert.dart';
import 'package:flutter/material.dart';

import '../../utils/nav.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text.dart';
import 'login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _bloc = LoginBloc();

  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();

    Future<Usuario> future = Usuario.get();
    future.then((Usuario user) {
      if (user != "" && user != null) {
        push(context, HomePage(), replace: true);
      }
    });
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
            StreamBuilder(
                stream: _bloc.buttonBloc.stream,
                builder: (context, snapshot) {
                  return AppButton(
                    "Login",
                    () => _onClickLogin,
                    showProgress: snapshot.data ?? false ,
                  );
                }),
          ],
        ),
      ),
    );
  }

  _onClickLogin() async {
    bool? formOk = _formKey.currentState?.validate();

    if (formOk == null || formOk == false) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login $login, Senha $senha");

    ApiResponse response = await _bloc.login(login, senha);

    if (response.ok) {
      Usuario user = response.result;

      print(">>> $user");
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg);
    }

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

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
  }
}

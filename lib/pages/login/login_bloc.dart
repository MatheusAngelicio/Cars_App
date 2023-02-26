import 'dart:async';

import 'package:cars_app/pages/login/usuario.dart';
import 'package:cars_app/pages/simple_bloc.dart';

import '../api_response.dart';
import 'login_api.dart';

//Aqui neste exemplo eu poderia herdar de SimpleBloc, porém fiz um exemplo se
// minha classe tivesse mais de uma stream.

class LoginBloc {

  final buttonBloc = SimpleBloc<bool>();
  // outra stream
  // outra stream ...

  Future<ApiResponse<Usuario>> login(String login, String senha) async {

    buttonBloc.add(true);

    ApiResponse<Usuario> response = await LoginApi.login(login, senha);

    buttonBloc.add(false);

    return response;

  }

  void dispose() {
    buttonBloc.dispose();
  }
}

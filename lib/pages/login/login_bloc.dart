import 'dart:async';

import 'package:cars_app/pages/login/usuario.dart';

import '../api_response.dart';
import 'login_api.dart';

class LoginBloc {

  final _loadButtonStreamController = StreamController<bool>();
  Stream <bool> get loadButtonStream => _loadButtonStreamController.stream;

  Future<ApiResponse<Usuario>> login(String login, String senha) async {

    _loadButtonStreamController.add(true);

    ApiResponse<Usuario> response = await LoginApi.login(login, senha);

    _loadButtonStreamController.add(false);

    return response;

  }

  void dispose() {
    _loadButtonStreamController.close();
  }
}

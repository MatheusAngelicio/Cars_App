import 'dart:convert';

import 'package:cars_app/pages/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<Usuario> login(String login, String senha) async {
    var url = Uri.parse('https://carros-springboot.herokuapp.com/api/v2/login');

    Map<String,String> headers = {
      "Content-Type": "applications/json"
    };

    Map params = {
      "username": login,
      "password": senha
    };

    String s = json.encode(params);

    var response = await http.post(url, body: s, headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map mapResponse = json.decode(response.body);

    final user = Usuario.fromJason(mapResponse);

    return user;
  }
}

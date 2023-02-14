import 'package:cars_app/pages/login/usuario.dart';

import 'carro.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TipoCarro {
  static const String classicos = "classicos";
  static const String esportivos = "esportivos";
  static const String luxo = "luxo";
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async {

    String s = tipo.toString().replaceAll("TipoCarro.", "");

    Usuario user = await Usuario.get();

    Map<String,String> headers = {
      "Content-Type": "applications/json",
      "Authorization": "Bearer ${user.token}"
    };

    var url = Uri.parse('https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$s');

    print("GET > $url");

    var response = await http.get(url, headers: headers);

    String json = response.body;

    List list = convert.json.decode(json);

    return list.map<Carro>((map) => Carro.fromJson(map)).toList();

  }
}

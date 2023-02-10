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

    var url = Uri.parse('https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$s');

    print("GET > $url");

    var response = await http.get(url);

    String json = response.body;

    List list = convert.json.decode(json);

    return list.map<Carro>((map) => Carro.fromJson(map)).toList();

  }
}

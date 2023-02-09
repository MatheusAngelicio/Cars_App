
import 'carro.dart';

class CarrosApi {
  static Future<List<Carro>> getCarros() async {
    final carros = <Carro>[];

    await Future.delayed(Duration(seconds: 2));

    carros.add(Carro(nome: "Ferrari FF", urlFoto: "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/Maserati_Grancabrio_Sport.png"));
    carros.add(Carro(nome: "MERCEDES-BENZ C63 AMG", urlFoto: "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/MERCEDES_BENZ_AMG.png"));
    carros.add(Carro(nome: "Hudson Hornet", urlFoto: "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Cadillac_Eldorado.png"));

    return carros;
  }
}
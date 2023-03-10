import 'dart:async';

import 'package:cars_app/pages/simple_bloc.dart';

import 'carro.dart';
import 'carros_api.dart';

class CarrosBloc extends SimpleBloc<List<Carro>>  {

  fetch(String tipo) async {
    try {
      List<Carro> carros = await CarrosApi.getCarros(tipo);
      add(carros);
    } catch(e) {
      addError(e);
    }
  }
}

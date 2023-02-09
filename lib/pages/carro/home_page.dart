import 'package:cars_app/drawer_list.dart';
import 'package:cars_app/pages/carro/carro.dart';
import 'package:cars_app/pages/carro/carros_api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
      drawer: DrawerList(),
    );
  }

  _body() {
    List<Carro> carros = CarrosApi.getCarros();

    return ListView.builder(
        itemCount: carros.length,
        itemBuilder: (context, index) {
          Carro c = carros[index];

          return Row(
            children: [
              Image.network(c.urlFoto ?? "", width: 150,)
            ],
          );
        });
  }
}

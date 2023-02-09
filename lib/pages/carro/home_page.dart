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
    return FutureBuilder(
      future: CarrosApi.getCarros(),
      builder: (context, snapshot) {

        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        } else {
          List<Carro> carros = snapshot.data ?? List.empty();
          return _listView(carros);
        }

      },
    );
  }

  Container _listView(List<Carro> carros) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: carros.length,
          itemBuilder: (context, index) {
            Carro c = carros[index];

            return Card(
              color: Colors.grey[100],
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                        c.urlFoto ?? "",
                        width: 250,
                      ),
                    ),
                    Text(
                      c.nome ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    const Text(
                      "Descrição...",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    ButtonTheme(
                        child: ButtonBar(
                      children: [
                        TextButton(
                          child: const Text("DETALHES"),
                          onPressed: () {},
                        ),
                        TextButton(
                          child: const Text("COMPARTILHAR"),
                          onPressed: () {},
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            );
          }),
    );
  }
}

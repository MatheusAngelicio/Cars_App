import 'dart:async';

import 'package:cars_app/pages/carro/carro_page.dart';
import 'package:cars_app/pages/carro/carros_model.dart';
import 'package:cars_app/utils/nav.dart';
import 'package:cars_app/widgets/text_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'carro.dart';

class CarrosListView extends StatefulWidget {
  String tipo;

  CarrosListView(this.tipo);

  @override
  State<CarrosListView> createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView>
    with AutomaticKeepAliveClientMixin<CarrosListView> {
  List<Carro>? carros;

  final _model = CarrosModel();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _fetch();
  }

  void _fetch() {
    _model.fetch(widget.tipo);

  }



  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Observer(
      builder: (_) {

        List<Carro>? carros = _model.carros;

        if (_model.error != null) {
          return TextError(msg: "Não foi possível buscar os carros", onPressed: () {_fetch();});

        }
        if (_model.carros == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return _listView(carros ?? List.empty());
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
                        c.urlFoto ??
                            "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Cadillac_Eldorado.png",
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
                          onPressed: () {
                            onClickCarro(c);
                          },
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

  onClickCarro(Carro c) {
    push(context, CarroPage(c));
  }

}

import 'package:cars_app/drawer_list.dart';
import 'package:cars_app/pages/carro/carro.dart';
import 'package:cars_app/pages/carro/carros_api.dart';
import 'package:cars_app/pages/carro/carros_listview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: CarrosListView(),
      drawer: DrawerList(),
    );
  }


}

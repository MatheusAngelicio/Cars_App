import 'package:cars_app/drawer_list.dart';
import 'package:cars_app/pages/carro/carros_listview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Carros"),
          bottom: const TabBar(tabs: [
            Tab(text: "Clássicos",),
            Tab(text: "Esportivos",),
            Tab(text: "Luxo",),
          ],),
        ),
        body: const TabBarView(children: [
          CarrosListView(),
          CarrosListView(),
          CarrosListView(),
        ],),
        drawer: DrawerList(),
      ),
    );
  }


}

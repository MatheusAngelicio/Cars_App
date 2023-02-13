import 'package:cars_app/drawer_list.dart';
import 'package:cars_app/pages/carro/carros_api.dart';
import 'package:cars_app/pages/carro/carros_listview.dart';
import 'package:flutter/material.dart';

import '../../utils/prefs.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage>{

  late TabController _tabController;

  @override
  void initState(){
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    Future<int> future = Prefs.getInt("tabIdx");

    future.then((int tabIdx) {
      _tabController.index = tabIdx;
    });

    _tabController.addListener(() {
      print("TAB > ${_tabController.index}");
      Prefs.setInt("tabIdx", _tabController.index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
          Tab(text: "Clássicos",),
          Tab(text: "Esportivos",),
          Tab(text: "Luxo",),
        ],),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
        CarrosListView(TipoCarro.classicos),
        CarrosListView(TipoCarro.esportivos),
        CarrosListView(TipoCarro.luxo),
      ],),
      drawer: DrawerList(),
    );
  }
}

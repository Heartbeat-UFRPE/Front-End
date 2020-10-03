import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'Cardapio/AlimentoListStyle/alimento_tile.dart';
import 'Cardapio/DUMMY_Alimentos.dart';


class Cardapio extends StatefulWidget {
  @override
  _CardapioState createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {

  String _currentday = "Segunda-feira";
  dynamic data;

  Future<String> getJSONData() async{
    final String url = "http://192.168.0.7:3333/cardapio";
    var response = await http.get(url);
    data = json.decode(response.body);
    print(data);
  }

  @override
  void initState(){
    super.initState();
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    final Alimentos = {...DUMMY_Alimentos};

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () { Scaffold.of(context).openDrawer(); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(_currentday),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            stops: [
            0.8,
            0.2
            ],
      colors: [
      //F94F4F
      Color(0xFFFFFFFF),
      Color(0xFFFFCDD2)
      ])),
      child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Stack(
              children: <Widget>[
                  Column(
                  children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(
                            top: 20,
                            bottom: 15
                          ),
                          child: Text(
                            "Café da Manhã",
                            style: TextStyle(color: Colors.red, fontSize: 21),

                          ),

                      ),
                      Container(
                        child: SizedBox(
                            height: 200,
                            child: new Expanded( child :ListView.builder(
                                itemCount: Alimentos.length,
                                itemBuilder: (ctx, i) => AlimentoTile(Alimentos.values.elementAt(i)),
                             ),
                          )
                        ),

                  ),
                  Container(
                  padding: EdgeInsets.only(
                          top: 20,
                          bottom: 15
                      ),
                      child: Text(
                          "Almoço",
                          style: TextStyle(color: Colors.red, fontSize: 21),

                  ),

                  ),
                  Container(
                  child: SizedBox(
                    height: 300,
                    child: new Expanded( child :ListView.builder(
                        itemCount: Alimentos.length,
                        itemBuilder: (ctx, i) => AlimentoTile(Alimentos.values.elementAt(i)),
                       ),
                    )
                    ),


                  ),
                  Container(
                      padding: EdgeInsets.only(
                      top: 20,
                      bottom: 15
                      ),
                      child: Text(
                        "Jantar",
                        style: TextStyle(color: Colors.red, fontSize: 21),

                      ),

                  ),
                  Container(
                    child: SizedBox(
                      height: 300,
                      child: new Expanded( child :ListView.builder(
                          itemCount: Alimentos.length,
                          itemBuilder: (ctx, i) => AlimentoTile(Alimentos.values.elementAt(i)),
                      ),
                      )
                    ),


               ),
            ])

          ]
        )



       ])
    ));

}}

Future<http.Response> fetchAlbum() {
  return http.get('https://jsonplaceholder.typicode.com/albums/1');
}
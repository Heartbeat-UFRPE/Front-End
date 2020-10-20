import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'Cardapio/Alimento.dart';
import 'Cardapio/AlimentoListStyle/alimento_tile.dart';



class Cardapio extends StatefulWidget {
  @override
  _CardapioState createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {

  String _currentday = "segunda";
  dynamic data;


  Future<List<Alimento>> getJSONData(String weekDia , String dayhour) async{

    final String url = "http://192.168.0.7:4444/cardapio";
    var response = await http.get(url);
    data = json.decode(response.body);
    var dayfood = data[weekDia];
    var hourfood = dayfood[dayhour];
    List<Alimento> diafood = [];
    print(hourfood);
    for(var u in hourfood){

      Alimento alimento = Alimento(comida: u["comida"],Kcal: u["kcal"],quantidade: u["quantidade"]);
      diafood.add(alimento);
    }
    print(diafood);
    print("a");
    return diafood;
  }



  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () { Navigator.of(context).pop(); },
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
                            height: 150,
                            child: new Expanded( 
                                child : FutureBuilder(
                              future: getJSONData(_currentday , "cafe"),
                              builder: (BuildContext context, AsyncSnapshot snapshot){

                                if(snapshot.data == null){
                                  return Container(
                                    child: Center(
                                      child: Text("Loading..."),
                                    ),
                                  );
                                  } else {
                                  return ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (ctx, i) => AlimentoTile(snapshot.data[i]),

                                );}

                              },
                            )
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
                    height: 150,
                    child: new Expanded( child : FutureBuilder(
                        future: getJSONData(_currentday , "almoco"),
                        builder: (BuildContext context, AsyncSnapshot snapshot){

                        if(snapshot.data == null){
                          return Container(
                              child: Center(
                              child: Text("Loading..."),
                              ),
                              );
                          } else {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (ctx, i) => AlimentoTile(snapshot.data[i]),

                            );}

                        },
    )
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
                    height: 150,
                    child: new Expanded( child : FutureBuilder(
                      future: getJSONData(_currentday , "jantar"),
                      builder: (BuildContext context, AsyncSnapshot snapshot){

                        if(snapshot.data == null){
                        return Container(
                          child: Center(
                            child: Text("Loading..."),
                                ),
                              );
                        } else {
                          return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (ctx, i) => AlimentoTile(snapshot.data[i]),

                        );}

                          },
                        )
                    )
                  ),


                  ),
            ])

          ]
        )



       ])
    ));



}

  }


Future<http.Response> fetchAlbum() {
  return http.get('https://jsonplaceholder.typicode.com/albums/1');
}

import 'package:flutter/material.dart';
import 'dart:ui';

import 'Cardapio/Alimento.dart';
import 'Cardapio/AlimentoListStyle/alimento_tile.dart';
import 'Cardapio/DUMMY_Alimentos.dart';


class Cardapio extends StatefulWidget {
  @override
  _CardapioState createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
  String _currentday = "Segunda-feira";

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

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      color: Colors.red,
      width: 2.0,
    ),
  );
}
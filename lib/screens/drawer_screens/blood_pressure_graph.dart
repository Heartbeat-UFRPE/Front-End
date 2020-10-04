import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heartbeat/screens/components/custom_drawer.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;

class BloodPressureGraph extends StatefulWidget {
  @override
  _BloodPressureGraphState createState() => _BloodPressureGraphState();
}

class Pressao {
  final int date;
  final int pressao;

  Pressao({this.date, this.pressao});

  factory Pressao.fromJson(Map<String, dynamic> json) {
    return Pressao(
      date: json['date'] as int,
      pressao: json['pressao'] as int,
    );
  }
}

class _BloodPressureGraphState extends State<BloodPressureGraph> {

  TextEditingController _topPressure = TextEditingController();
  TextEditingController _bottomPressure = TextEditingController();

  Future<void> addPressure() async {
    final apiURL = 'https://jsonplaceholder.typicode.com/todos/1';
    await http.post(apiURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"topPressure": _topPressure.text,"bottomPressure":_bottomPressure.text}));

  }

   Future<List<Pressao>> getPressure() async{
    final apiURL = 'https://jsonplaceholder.typicode.com/todos/1';
    var response = await http.post(apiURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"topPressure": _topPressure.text,"bottomPressure":_bottomPressure.text}));

    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Pressao>((json) => Pressao.fromJson(json)).toList();

  }

   _getChart(){
     getPressure().then((value){

       var series = [
         charts.Series(
           domainFn: (Pressao pressaoData, _) => pressaoData.date,
           measureFn: (Pressao pressaoData, _) => pressaoData.pressao,
           colorFn: (Pressao pressaoData, _) => charts.Color.black,
           id: 'Clicks',
           data: value,
         ),
       ];

       var chart = charts.LineChart(
         series,
         animate: true,
       );

       return chart;
     });

  }

  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
//    var data = [
//      Pressao(0, 12),
//      Pressao(800, 42 ),
//      Pressao(1600, 64),
//      Pressao(2000, 70),
//      Pressao(2018, 79),
//    ];

    var chartWidget = Padding(
      padding: EdgeInsets.all(15.0),
      child: SizedBox(
        height: 300.0,
        child: _getChart(),
      ),
    );


    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showMyDialog(context);
        },
        child: FaIcon(FontAwesomeIcons.plus),
        backgroundColor: Color(0xffbf4747),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10),child:
              Text("Seu histórico de pressão",style: TextStyle(fontSize: 25))),
              chartWidget
            ],
          )
        ],
      ),
    );
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,// user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Digite sua pressão arterial de hoje'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _topPressure,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '140',
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Divider(),
                SizedBox(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _bottomPressure,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: '80',
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontWeight: FontWeight.w500)
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Salvar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


}

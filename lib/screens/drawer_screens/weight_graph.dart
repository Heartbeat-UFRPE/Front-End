import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heartbeat/screens/components/custom_drawer.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;

class WeightGraph extends StatefulWidget {
  @override
  _WeightGraphState createState() => _WeightGraphState();
}

class Weight {
  final int date;
  final int weight;

  Weight({this.date, this.weight});

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
      date: json['date'] as int,
      weight: json['weight'] as int,
    );
  }
}

class _WeightGraphState extends State<WeightGraph> {

  TextEditingController _weight = TextEditingController();

  Future<void> addPressure() async {
    final apiURL = 'https://jsonplaceholder.typicode.com/todos/1';
    await http.post(apiURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"weight": _weight.text}));

  }

  Future<List<Weight>> getPressure() async{
    final apiURL = 'https://jsonplaceholder.typicode.com/todos/1';
    var response = await http.post(apiURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"weight": _weight.text}));

    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Weight>((json) => Weight.fromJson(json)).toList();

  }

  _getChart(){
    getPressure().then((value){

      var series = [
        charts.Series(
          domainFn: (Weight pressaoData, _) => pressaoData.date,
          measureFn: (Weight pressaoData, _) => pressaoData.weight,
          colorFn: (Weight pressaoData, _) => charts.Color.black,
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
          title: Text('Digite seu peso de hoje'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _weight,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '140',
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Divider()
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

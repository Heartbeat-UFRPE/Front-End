import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heartbeat/screens/components/custom_drawer.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
      date: json['id'] as int,
      weight: json['value'] as int,
    );
  }
}

class _WeightGraphState extends State<WeightGraph> {

  TextEditingController _weight = TextEditingController();

  FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> addPressure() async {
    final apiURL = 'https://jsonplaceholder.typicode.com/todos/1';
    await http.post(apiURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"weight": _weight.text}));

  }

  Future<List<Weight>> getPressure() async{

    String userId = await _storage.read(key: "userId");


    final apiURL = 'http://192.168.100.5:4444/weight/$userId';

    var response = await http.get(apiURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Weight>((json) => Weight.fromJson(json)).toList();

  }

  _getChart(){
    getPressure().then((value){

      var series = [
        charts.Series(
          domainFn: (Weight pesoData, _) => pesoData.date,
          measureFn: (Weight pesoData, _) => pesoData.weight,
          colorFn: (Weight pesoData, _) => charts.Color.black,
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

    var chartWidget =  Padding(
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
              Text("Seu histórico de peso",style: TextStyle(fontSize: 25))),
              //chartWidget
              Container(color: Colors.deepPurpleAccent,
                  width: 500,
                  child: chartWidget)
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'home.dart';


class Anamnese extends StatefulWidget {
  @override
  _AnamneseState createState() => _AnamneseState();
}

class _AnamneseState extends State<Anamnese> {
  double _currentSliderValueSono = 8;
  double _currentSliderValuePeso = 70;
  double _currentSliderValueAltura = 170;
  double _currentSliderValueestresse = 5;
  bool _checkHipertensao = false;
  bool _checkdiabetes = false;
  bool _checkanemia = false;
  bool _checkcadio = false;
  bool _checkfumante = false;
  bool _checksimExercicio = true;
  bool _checknaoExercicio = false;
  String sono_value ;
  String peso_value ;
  String altura_value;
  String estresse_value;
  String hipertessao_values;
  String diabetes_values;
  String cardioDeaseses_values;
  String smoking_values;
  String anemic_values;
  String excersises_values;
  FlutterSecureStorage _storage = FlutterSecureStorage();

  void sendAnamnese() async{
    String userId = await _storage.read(key: "userId");
    final apiURLanamnese = 'http://192.168.100.5:4444/anamnese/$userId';
    await http.post(apiURLanamnese,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "UserID": userId,
          "height": altura_value,
          "weight": peso_value,
          "highPressure": hipertessao_values,
          "heartDiseases": cardioDeaseses_values,
          "physicalActivity": excersises_values,
          "stress": estresse_value,
          "hoursSleep": sono_value,
          "anaemia": anemic_values,
          "smoking": smoking_values,
          "diabetes": diabetes_values}));

    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> Home() ));
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
        onPressed: () { Scaffold.of(context).openDrawer(); },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
    ),
    title: Text("Anamnese"),
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
                      Padding(
                        padding: EdgeInsets.only(top:17,bottom: 1),
                        child: Image.asset("assets/heart.png",
                            width: 80,
                            height: 80,
                            fit: BoxFit.contain),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Form(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: TextFormField(
                                  enabled: false,
                                  obscureText: false,
                                  style: TextStyle(
                                      color: Colors.black87
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Qual o seu peso?",
                                      hintStyle: TextStyle(color: Colors.black87,fontSize: 18),
                                      contentPadding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          right: 30,
                                          left: 2
                                      )
                                  ),
                                ),

                              ),

                              Container(

                                child: Slider(
                                  value: _currentSliderValuePeso,
                                  min: 45,
                                  max: 170,
                                  divisions: 125,
                                  activeColor: Colors.red,
                                  label: (_currentSliderValuePeso.round().toString()),
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentSliderValuePeso = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                child: TextFormField(
                                  enabled: false,
                                  obscureText: false,
                                  style: TextStyle(
                                      color: Colors.black87
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Qual a sua Altura? (Em cm)",
                                      hintStyle: TextStyle(color: Colors.black87,fontSize: 18),
                                      contentPadding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          right: 30,
                                          left: 2
                                      )
                                  ),
                                ),

                              ),

                              Container(

                                child: Slider(
                                  value: _currentSliderValueAltura,
                                  min: 130,
                                  max: 210,
                                  divisions: 80,
                                  activeColor: Colors.red,
                                  label: (_currentSliderValueAltura.round().toString()),
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentSliderValueAltura = value;
                                    });
                                  },
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.only(
                                    top: 15,
                                    bottom: 10
                                ),
                                child: Text(
                                    "Você possui alguma dessas enfermidades ?",
                                    style: TextStyle(color: Colors.black87, fontSize: 19),

                                ),

                              ),
                              Container (
                                child: CheckboxListTile(
                                    title: const Text('Hipertensão', style: TextStyle(color: Colors.black87),),
                                    checkColor: Colors.white,
                                    value: _checkHipertensao,
                                    activeColor: Colors.red,
                                    onChanged: (bool value) {
                                      setState(() { if (_checkHipertensao == true) {_checkHipertensao = false;} else {_checkHipertensao = true;}
                                      });
                                    },
                                    secondary: const Icon(Icons.add, color: Colors.black87,),
                                  )
                              ),
                              Container (
                                  child: CheckboxListTile(
                                    title: const Text('Diabetes', style: TextStyle(color: Colors.black87),),
                                    checkColor: Colors.white,
                                    value: _checkdiabetes,
                                    activeColor: Colors.red,
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (_checkdiabetes == true) {_checkdiabetes = false;} else {_checkdiabetes = true;}
                                      });
                                    },
                                    secondary: const Icon(Icons.add, color: Colors.black87,),
                                  )
                              ),
                              Container (
                                  child: CheckboxListTile(
                                    title: const Text('Doenças cardiovasculares', style: TextStyle(color: Colors.black87),),
                                    checkColor: Colors.white,
                                    value: _checkcadio,
                                    activeColor: Colors.red,

                                    onChanged: (bool value) {
                                      setState(() {
                                        if (_checkcadio == true) {_checkcadio = false;} else {_checkcadio = true;}
                                      });
                                    },
                                    secondary: const Icon(Icons.add, color: Colors.black87,),
                                  )
                              ),
                              Container (
                                  child: CheckboxListTile(
                                    title: const Text('Anemia', style: TextStyle(color: Colors.black87),),
                                    checkColor: Colors.white,
                                    value: _checkanemia,
                                    activeColor: Colors.red,

                                    onChanged: (bool value) {
                                      setState(() {
                                        if (_checkanemia == true) {_checkanemia = false;} else {_checkanemia = true;}
                                      });
                                    },
                                    secondary: const Icon(Icons.add, color: Colors.black87,),
                                  )
                              ),
                              Container (
                                  child: CheckboxListTile(
                                    title: const Text('Fumante', style: TextStyle(color: Colors.black87),),
                                    checkColor: Colors.white,
                                    value: _checkfumante,
                                    activeColor: Colors.red,

                                    onChanged: (bool value) {
                                      setState(() {
                                        if (_checkfumante == true) {_checkfumante = false;} else {_checkfumante = true;}
                                      });
                                    },
                                    secondary: const Icon(Icons.add, color: Colors.black87,),
                                  )
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 15,
                                    bottom: 10
                                ),
                                child: Text(
                                  "Você pratica exercicios físicos ?",
                                  style: TextStyle(color: Colors.black87, fontSize: 19),

                                ),

                              ),
                              Container (
                                  child: CheckboxListTile(
                                    title: const Text('Sim', style: TextStyle(color: Colors.black87),),
                                    checkColor: Colors.white,
                                    value: _checksimExercicio ,
                                    activeColor: Colors.red,

                                    onChanged: (bool value) {
                                      setState(() {
                                        if (_checksimExercicio == false) {
                                          _checksimExercicio = true ;
                                          _checknaoExercicio = false;
                                        }
                                      });
                                    },
                                    secondary: const Icon(Icons.check, color: Colors.black87,),
                                  ),

                              ),
                              Container (
                                child: CheckboxListTile(
                                  title: const Text('Não', style: TextStyle(color: Colors.black87),),
                                  checkColor: Colors.white,
                                  value: _checknaoExercicio,
                                  activeColor: Colors.red,

                                  onChanged: (bool value) {
                                    setState(() {
                                      if (_checknaoExercicio == false) {
                                        _checknaoExercicio = true ;
                                        _checksimExercicio = false;
                                      }
                                    });
                                  },
                                  secondary: const Icon(Icons.clear, color: Colors.black87,),
                                ),

                              ),
                              Container(
                                child: TextFormField(
                                  enabled: false,
                                  obscureText: false,
                                  style: TextStyle(
                                      color: Colors.black87
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Quantas horas de sono diário?",
                                      hintStyle: TextStyle(color: Colors.black87,fontSize: 18),
                                      contentPadding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          right: 30,
                                          left: 2
                                      )
                                  ),
                                ),

                              ),

                              Container(

                                child: Slider(
                                  value: _currentSliderValueSono,
                                  min: 4,
                                  max: 14,
                                  divisions: 10,
                                  activeColor: Colors.red,
                                  label: (_currentSliderValueSono.round().toString()),
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentSliderValueSono = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                child: TextFormField(
                                  enabled: false,
                                  obscureText: false,
                                  style: TextStyle(
                                      color: Colors.black87
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "De 0 a 10 o quanto você é estressado",
                                      hintStyle: TextStyle(color: Colors.black87,fontSize: 18),
                                      contentPadding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          right: 30,
                                          left: 2
                                      )
                                  ),
                                ),

                              ),
                              Container(

                                child: Slider(
                                  value: _currentSliderValueestresse,
                                  min: 0,
                                  max: 10,
                                  divisions: 11,
                                  activeColor: Colors.red,
                                  label: (_currentSliderValueestresse.round().toString()),
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentSliderValueestresse = value;
                                    });
                                  },
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.all(20.0),
                                height: 70,
                                width: 250,
                                child: RaisedButton(
                                  child: const Text("Continuar", textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                                  onPressed: () {trateAnamnese();},
                                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                  textColor: Colors.white,
                                  color: Colors.redAccent,
                                ),
                              )



                            ],
                          ),
                        ),
                      ),

                    ],
                  )
                ],
              )
            ],
          ),
        )
    );}
    void trateAnamnese() {

      sono_value = _currentSliderValueSono.toString();
      peso_value = _currentSliderValuePeso.toString();
      altura_value = _currentSliderValueAltura.toString();
      estresse_value = _currentSliderValueestresse.toString();
      if (_checkHipertensao){hipertessao_values = "1";}else{hipertessao_values = "0";}
      if (_checkdiabetes){diabetes_values = "1";}else{diabetes_values = "0";}
      if (_checkcadio){cardioDeaseses_values = "1";}else{cardioDeaseses_values = "0";}
      if (_checkfumante){smoking_values = "1";}else{smoking_values = "0";}
      if (_checkanemia){anemic_values = "1";}else{anemic_values = "0";}
      if (_checksimExercicio){excersises_values = "1";}else{excersises_values = "0";}

      sendAnamnese();
    }
}

import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:heartbeat/Constant.dart' ;
import 'package:http/http.dart' as http;

import '../login.dart';


class RecuperarSenha extends StatefulWidget {
  @override
  _RecuperarSenhaState createState() => _RecuperarSenhaState();
}
class _RecuperarSenhaState extends State<RecuperarSenha> {

  final _controlEmail = TextEditingController();
  DateTime nascimento = DateTime.utc(2000, 01, 01);

  void Recuperate() async{
    String emailcheck = _controlEmail.text;
    final apiURLcheck = 'http://192.168.0.7:4444/userEmail/$emailcheck';
    var response = await http.get(apiURLcheck,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.body != '[]') {
      dynamic resp = jsonDecode(response.body);
      final nasc = resp[0]["birth"];
      String nascimentoCheck = formatDate(nascimento,
          [ yyyy, "-", mm, "-", dd]);

      print(nasc);
      print(nascimentoCheck);
      if (  nasc.toString().contains(nascimentoCheck) ){
        final password = resp[0]["password"];
        showAlertDialogErro(context, "A senha foi retornada com sucesso \n \n Senha : " + password , "Recuperação de Senha" , true);

      }else {showAlertDialogErro(context, "Verifique se a sua data de nascimento está correta", "Opa !",false);}
    } else {
      showAlertDialogErro(context, "O email inserido não está cadastrado", "Opa !",false);

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [ 0.1, 0.2, 0.9 ],
            colors: [
            Color(0xffffffff),
            Color(0xfffffff1),
            Color(0xffbf4747)
        ])),
          child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top:70,bottom: 30),
                  child: Image.asset("assets/heart.png",
                      width: 160,
                      height: 160,
                      fit: BoxFit.contain),
                ),
                Center(

                child: Text("Recuperar a Senha",
                    style: TextStyle(
                        fontFamily: "VT323",
                        fontSize: 25.0),

                  ),

              ),

                Center(child : Container(
                  padding: EdgeInsets.only(top: 32, bottom: 12),
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.black87,
                              width: 0.9
                          )
                      )
                  ),
                  child: TextFormField(
                    controller: _controlEmail,
                    obscureText: false,
                    style: TextStyle(
                        color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                        icon: Icon(Icons.email,color: Colors.black87,),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.black87)),
                        hintText: "Digite o seu Email",
                        hintStyle: TextStyle(color: Colors.black87,fontSize: 15),
                        )
                    ),
                  )),
                Divider(),
                Center( child: Container(
                  padding: EdgeInsets.only(
                      top: 15,
                  ),
                  child: Text(
                    "Qual a sua data de nascimento?",
                    style: TextStyle(color: Colors.black87, fontSize: 17),
                    textAlign: TextAlign.left,
                  ),

                ),),
                Divider(),
                //---------------------------------------------------------------------------------------------------------------------------
                Center(child : Container(
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.black,
                                width: 0.5
                            )
                        )
                    ),

                    child: new GestureDetector(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: nascimento,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(DateTime
                              .now()
                              .year
                              .toInt() - 18),
                          builder: (BuildContext context,
                              Widget child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                textTheme: TextTheme(
                                    bodyText1: TextStyle(
                                        fontSize: 25)),
                                colorScheme: ColorScheme.light(
                                  primary: Colors.black,
                                ),
                              ),
                              child: child,
                            );
                          },
                        ).then((newDate) {
                          setState(() {
                            nascimento = newDate;
                          });
                        });
                      },

                      child: TextFormField(
                        enabled: false,
                        obscureText: true,
                        keyboardType: TextInputType.datetime,
                        style: TextStyle(
                            color: Colors.black
                        ),
                        decoration: InputDecoration(
                            icon: Icon(Icons.date_range,
                              color: Colors.black,),
                            border: InputBorder.none,
                            hintText: formatDate(nascimento,
                                [dd, "-", mm, "-", yyyy])
                                .toString(),
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15),
                            contentPadding: EdgeInsets.only(
                                right: 30,
                                left: 5
                            )
                        ),

                      ),
                    )
                ),),

                Divider(),
                Container(
                  margin: EdgeInsets.all(18.0),
                  height: 60,
                  width: 50,
                  child: RaisedButton(
                    child: const Text("Enviar a Senha", textAlign: TextAlign.center,style: TextStyle(fontSize: 17),),
                    onPressed: () {Recuperate();},
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(22.0)),
                    textColor: Colors.red,
                    color: Colors.white,
                  ),
                )

              ],
          ),
      ),

    );

  }
  showAlertDialogErro(BuildContext context, String alerta, String upperText, bool exitPlace) {
    Widget naoButton = FlatButton(
      child: Text("Ok!", style: TextStyle(color: Colors.amberAccent),
      ),
      onPressed:  () {
        if (exitPlace == true){
          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> Login() ));
        }else{Navigator.of(context).pop();}
        },
    );
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      backgroundColor: Colors.red,
      title: Text(upperText, style: TextStyle(color: Colors.white),),
      content: Text(alerta, style: TextStyle(color: Colors.white),),
      actions: [
        naoButton,

      ],
      elevation: 24.0,
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heartbeat/screens/home.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../login.dart';


class Configuration extends StatefulWidget {
  @override
  _ConfigurationState createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {

  FlutterSecureStorage _storage = FlutterSecureStorage();

  final apiURLchangeemail = 'http://192.168.0.7:4444/login';
  final _controlnewEmail = TextEditingController();

  void changeEmail() async{
    String emailcheck = _controlnewEmail.text;
    final apiURLcheck = 'http://192.168.0.7:4444/userEmail/$emailcheck';
    var response = await http.get(apiURLcheck,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    print(response.body);
    if (response.body == '[]') {
      if (_validateEmail(_controlnewEmail.text) == null) {
        String userId = await _storage.read(key: "userId");
        final apiURLupEmail = 'http://192.168.0.7:4444/user/update/email/$userId';
        await http.post(apiURLupEmail,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              "email": _controlnewEmail.text,}));
        Navigator.of(context).pop();
        showAlertDialogErro(context, "Email Alterada com Sucesso!","Uhuuuuuuuuuu !");
      }else {showAlertDialogErro(context, _validateEmail(_controlnewEmail.text), "Opa !");}
    }else {showAlertDialogErro(context, "Este email já foi cadastrado", "Opa !");}
  }

  final _controlSenha = TextEditingController();

  void changeSenha() async{
    String userId = await _storage.read(key: "userId");
    final apiURLupSenha = 'http://192.168.0.7:4444/user/update/password/$userId';
      if (_validateSenha(_controlSenha.text) == null){
        await http.post(apiURLupSenha,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              "password": _controlSenha.text,}));
        Navigator.of(context).pop();
        showAlertDialogErro(context, "Senha Alterada com Sucesso!","Uhuuuuuuuuuu !");

    }else {showAlertDialogErro(context, _validateSenha(_controlSenha.text),"Opa !");}
  }

  void deleteAccount() async{
    String userId = await _storage.read(key: "userId");
    final apiURLdelAcc = 'http://192.168.0.7:4444/user/delete/$userId';
    await http.get(apiURLdelAcc,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    await _storage.deleteAll();
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> Login() ));
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
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> Home() ));
                },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text("Configurações"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
            ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: (){showAlertDialogAlterEmail(context);},
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.black,
                                            width: 0.5
                                        )
                                    )
                                ),
                                child: TextFormField(
                                  enabled: false,
                                  obscureText: false,
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Alterar email",
                                      hintStyle: TextStyle(color: Colors.black,fontSize: 17),
                                      contentPadding: EdgeInsets.only(
                                          top: 30,
                                          bottom: 30,
                                          right: 30,
                                          left: 2
                                      )
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){showAlertDialogAlterSenha(context);},
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.black,
                                            width: 0.5
                                        )
                                    )
                                ),
                                child: TextFormField(
                                  enabled: false,
                                  obscureText: false,
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Alterar senha",
                                      hintStyle: TextStyle(color: Colors.black,fontSize: 17),
                                      contentPadding: EdgeInsets.only(
                                          top: 30,
                                          bottom: 30,
                                          right: 30,
                                          left: 2
                                      )
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                                onTap: (){
                                  showAlertDialogDelete(context);
                                },
                                child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.red,
                                                  width: 0.8
                                              )
                                          )
                                      ),
                                      child: TextFormField(
                                        enabled: false,
                                        obscureText: false,
                                        style: TextStyle(
                                            color: Colors.black
                                        ),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Deletar conta",
                                            hintStyle: TextStyle(color: Colors.red,fontSize: 18),
                                            contentPadding: EdgeInsets.only(
                                                top: 30,
                                                bottom: 30,
                                                right: 30,
                                                left: 2
                                            )
                                        ),
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  String _validateEmail(String email) {
    if (email.length < 3 || email.length > 50) {
      return "O email deve possuir mais de 3 caracteres e menos de 50 caracteres";
    }
    RegExp reg = new RegExp(r"^[^@]+@[^@]+\.[^@]+$");
    if (reg.hasMatch(email) == false) {
      return "Insira um email valido";
    }
    return null;
  }

  String _validateSenha(String senha) {
    if (senha.length < 4 || senha.length > 15) {
      return "A senha deve possuir mais de 4 e menos de 15 caracteres";
    }
    return null;
  }

  showAlertDialogAlterEmail(BuildContext context) {
    Widget novoEmail = TextField(
        obscureText: false,
        controller: _controlnewEmail,
        style: TextStyle(
            color: Colors.black
        ),
        decoration: InputDecoration(
            icon: Icon(Icons.email,color: Colors.black,),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ) ,
            border: UnderlineInputBorder(
            ),
            hintText: "Novo Email",
            hintStyle: TextStyle(color: Colors.black,fontSize: 15),
            contentPadding: EdgeInsets.only(
                top: 30,
                bottom: 30,
                right: 30,
                left: 5
            )
        ),
    );
    Widget naoButton = FlatButton(
      child: Text("Cancelar"),
      onPressed:  () {Navigator.of(context).pop();},
    );
    Widget simButton = FlatButton(
      child: Text("Alterar"),
      onPressed:  () {changeEmail();},
    );
    AlertDialog alert = AlertDialog(
      title: Text("Alterar Email"),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      content: novoEmail,
      actions: [
        naoButton,
        simButton,
      ],
      elevation: 24.0,
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  showAlertDialogErro(BuildContext context, String alerta, String upperText) {
    Widget naoButton = FlatButton(
      child: Text("Ok!", style: TextStyle(color: Colors.amberAccent)),
      onPressed:  () {Navigator.of(context).pop();},
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
  showAlertDialogAlterSenha(BuildContext context) {
    Widget novaSenha = TextField(
      controller: _controlSenha,
      obscureText: false,
      style: TextStyle(
          color: Colors.black
      ),
      decoration: InputDecoration(
          icon: Icon(Icons.lock,color: Colors.black,),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ) ,
          border: UnderlineInputBorder(
          ),
          hintText: "Nova Senha",
          hintStyle: TextStyle(color: Colors.black,fontSize: 15),
          contentPadding: EdgeInsets.only(
              top: 30,
              bottom: 30,
              right: 30,
              left: 5
          )
      ),
    );
    Widget naoButton = FlatButton(
      child: Text("Cancelar"),
      onPressed:  () {Navigator.of(context).pop();},
    );
    Widget simButton = FlatButton(
      child: Text("Alterar"),
      onPressed:  () {changeSenha();},
    );
    AlertDialog alert = AlertDialog(
      title: Text("Alterar Senha"),
      content: novaSenha,
      actions: [
        naoButton,
        simButton,
      ],
      elevation: 24.0,
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  showAlertDialogDelete(BuildContext context) {
        Widget naoButton = FlatButton(
          child: Text("Cancelar" , style: TextStyle(color: Colors.white),),
          onPressed:  () {Navigator.of(context).pop();},
        );
        Widget simButton = FlatButton(
        child: Text("Deletar" , style: TextStyle(color: Colors.white),),
        onPressed:  () {deleteAccount();},
        );
        AlertDialog alert = AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          backgroundColor: Colors.red,
        title: Text("Deletar Conta" , style: TextStyle(color: Colors.white),),

        actions: [
        naoButton,
        simButton,
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
import 'package:flutter/material.dart';
import 'dart:ui';

class Configuration extends StatefulWidget {
  @override
  _ConfigurationState createState() => _ConfigurationState();
}
showAlertDialogDelete(BuildContext context) {
  Widget naoButton = FlatButton(
    child: Text("Não"),
    onPressed:  () {Navigator.of(context).pop();},
  );
  Widget simButton = FlatButton(
    child: Text("Sim"),
    color: Colors.red,
    onPressed:  () {},
  );
  AlertDialog alert = AlertDialog(
    title: Text("Deletar a conta"),
    content: Text("Você tem certeza?"),
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
class _ConfigurationState extends State<Configuration> {
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
}
showAlertDialogAlterEmail(BuildContext context) {
  Widget novoEmail = TextField(
      obscureText: false,
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
    onPressed:  () {},
  );
  AlertDialog alert = AlertDialog(
    title: Text("Alterar Email"),
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
showAlertDialogAlterSenha(BuildContext context) {
  Widget novaSenha = TextField(
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
    onPressed:  () {},
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
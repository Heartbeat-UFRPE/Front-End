import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heartbeat/screens/Register.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:heartbeat/screens/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final apiURL = 'https://jsonplaceholder.typicode.com/todos/1';
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();


  void authenticate () async{
      var response = await http.post(apiURL,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"email": emailController.text,"password":senhaController.text}));
      print(response);
      //Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> Home() ));
      //Navigator.pushNamed(context, "/home");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.1,
                  0.5,
                  0.8,
                  0.9
                ],
                colors: [
                  //F94F4F
                  Color(0xffe61919),
                  Color(0xffc93030),
                  Color(0xffbf4747),
                  Color(0xff950C0C)
                ])),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top:70,bottom: 30),
                  child: Image.asset("assets/heart.png",
                      width: 160,
                      height: 160,
                      fit: BoxFit.contain),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.white70,
                                      width: 0.5
                                  )
                              )
                          ),
                          child: TextFormField(
                            controller: emailController,
                            obscureText: false,
                            style: TextStyle(
                                color: Colors.white70
                            ),
                            decoration: InputDecoration(
                                icon: Icon(Icons.email,color: Colors.white70,),
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.white70,fontSize: 15),
                                contentPadding: EdgeInsets.only(
                                    top: 30,
                                    bottom: 30,
                                    right: 30,
                                    left: 5
                                )
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.white70,
                                      width: 0.5
                                  )
                              )
                          ),
                          child: TextFormField(
                            controller: senhaController,
                            obscureText: true,
                            style: TextStyle(
                                color: Colors.white70
                            ),
                            decoration: InputDecoration(
                                icon: Icon(Icons.lock,color: Colors.white70,),
                                border: InputBorder.none,
                                hintText: "Senha",
                                hintStyle: TextStyle(color: Colors.white70,fontSize: 15),
                                contentPadding: EdgeInsets.only(
                                    top: 30,
                                    bottom: 30,
                                    right: 30,
                                    left: 5
                                )
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(20.0),
                    height: 60,
                    width: 230,
                    child: RaisedButton(
                      child: const Text("Entrar", textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                      onPressed: () => authenticate(),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      textColor: Colors.red,
                      color: Colors.white,
                    )),
                Container(
                  margin: EdgeInsets.all(20),
                  child: GestureDetector(
                    child: Text("Ainda não tem uma conta?",
                      style: TextStyle(color: Color(0xf1a0dc6)),),
                    onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => Register()
                    )),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

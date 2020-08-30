import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                  0.9
                ],
                colors: [
                  //F94F4F
                  Colors.white,
                  Colors.redAccent,
                ])),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
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
                                obscureText: true,
                                style: TextStyle(
                                    color: Colors.white70
                                ),
                                decoration: InputDecoration(
                                    icon: Icon(Icons.navigation,color: Colors.white70,),
                                    border: InputBorder.none,
                                    hintText: "Nome",
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
                                obscureText: true,
                                style: TextStyle(
                                    color: Colors.white70
                                ),
                                decoration: InputDecoration(
                                    icon: Icon(Icons.lock,color: Colors.white70,),
                                    border: InputBorder.none,
                                    hintText: "Repetir Senha",
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
                              margin: EdgeInsets.all(20.0),
                              height: 70,
                              width: 250,
                              child: RaisedButton(
                                  child: const Text("Registrar-se", textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                                  onPressed: () {},
                                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                  textColor: Colors.red,
                                  color: Colors.white,
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
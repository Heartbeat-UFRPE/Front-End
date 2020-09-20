import 'package:flutter/material.dart';

class RecuperarSenha extends StatefulWidget {
  @override
  _RecuperarSenhaState createState() => _RecuperarSenhaState();
}
class _RecuperarSenhaState extends State<RecuperarSenha> {
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


                Container(
                  margin: EdgeInsets.all(20.0),
                  height: 60,
                  width: 160,
                  child: RaisedButton(
                    child: const Text("Enviar a Senha", textAlign: TextAlign.center,style: TextStyle(fontSize: 17),),
                    onPressed: () {},
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

}
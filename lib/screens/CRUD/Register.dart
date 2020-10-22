import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heartbeat/screens/Anamnese.dart';
import 'package:heartbeat/screens/Login.dart';
import 'package:date_format/date_format.dart';
import 'package:heartbeat/Constant.dart' ;
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'RecuperarSenha.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  FlutterSecureStorage _storage = FlutterSecureStorage();

  Constant constant = Constant();
  final _controlNome = TextEditingController();
  final _controlEmail = TextEditingController();
  final _controlSenha = TextEditingController();
  final _controlConfirmSenha = TextEditingController();
  String _controlSex = "M";
  bool _checkedtermos = false;
  bool _checkMasculino = true;
  bool _checkFeminino = false;
  final GlobalKey<FormState> _globalRegisterKey = new GlobalKey<FormState>();

  DateTime nascimento = DateTime.utc(2000, 01, 01);

  Future<String> _setStorageKey(String _key,_value) async{
    await _storage.write(key: _key,value:_value.toString());

  }

  Future<void> createUser() async {
    String emailcheck = _controlEmail.text;
    final apiURLcheck = 'http://192.168.0.7:4444/userEmail/$emailcheck';
    var response = await http.get(apiURLcheck,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    print(response.body);
    if (response.body == '[]') {
      final apiURLcreate = 'http://192.168.0.7:4444/user/create';
      await http.post(apiURLcreate,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "name": _controlNome.text,
            "email": _controlEmail.text,
            "birth": nascimento.toIso8601String(),
            "sex": _controlSex,
            "password": _controlSenha.text}));
      final apiURLlogin = 'http://192.168.0.7:4444/login';
      var response = await http.post(apiURLlogin,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{"email": _controlEmail.text,"password":_controlSenha.text}));
      dynamic resp = jsonDecode(response.body);
      print(resp);

      final token = resp["token"];
      final userId = resp["user"][0]["id"];
      final userName = resp["user"][0]["name"];
      final email = resp["user"][0]["email"];
      _setStorageKey("token", token);
      _setStorageKey("userId", userId);
      _setStorageKey("userName", userName);
      _setStorageKey("userEmail", email);
      print("a teste");

      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> Anamnese() ));

    }else{
      showAlertDialogErro(context, "O email já foi castrado.");
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Form(
          autovalidate: true,
          key: _globalRegisterKey,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                      0.9,
                      0.1
                    ],
                    colors: [
                      Colors.white,
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
                          padding: EdgeInsets.only(top: 70, bottom: 30),
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
                                //------------------------------------ ------------------------------------------------------------------------------------------------------
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.redAccent,
                                              width: 0.5
                                          )
                                      )
                                  ),
                                  child: TextFormField(
                                    controller: _controlNome,
                                    style: TextStyle(
                                        color: Colors.red
                                    ),
                                    decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.navigation, color: Colors.redAccent,),
                                        border: InputBorder.none,
                                        hintText: "Nome",
                                        hintStyle: TextStyle(
                                            color: Colors.redAccent, fontSize: 16),
                                        contentPadding: EdgeInsets.only(
                                            top: 30,
                                            bottom: 30,
                                            right: 30,
                                            left: 5
                                        )
                                    ),
                                  ),
                                ),
                                //------------------------------------ ------------------------------------------------------------------------------------------------------
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 15,
                                  ),
                                  child: Text(
                                    "Qual o seu sexo ?",
                                    style: TextStyle(color: Colors.red, fontSize: 17),

                                  ),

                                ),

                                Container (
                                  child: CheckboxListTile(
                                    title: const Text('Feminino', style: TextStyle(color: Colors.redAccent),),
                                    checkColor: Colors.white,
                                    value: _checkFeminino ,
                                    activeColor: Colors.red,

                                    onChanged: (bool value) {
                                      setState(() {
                                        if (_checkFeminino == false) {
                                          _checkFeminino = true ;
                                          _checkMasculino = false;
                                        }
                                      });
                                    },
                                    secondary: const Icon(Icons.person, color: Colors.redAccent,),
                                  ),

                                ),

                                Container (
                                  child: CheckboxListTile(
                                    title: const Text('Masculino', style: TextStyle(color: Colors.redAccent),),
                                    checkColor: Colors.white,
                                    value: _checkMasculino,
                                    activeColor: Colors.red,

                                    onChanged: (bool value) {
                                      setState(() {
                                        if (_checkMasculino == false) {
                                          _checkMasculino = true ;
                                          _checkFeminino = false;
                                        }
                                      });
                                    },
                                    secondary: const Icon(Icons.person, color: Colors.redAccent,),
                                  ),

                                ),
                                //---------------------------------------------------------------------------------------------------------------------------

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
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.red,
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
                                                  primary: Colors.red,
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
                                            color: Colors.white70
                                        ),
                                        decoration: InputDecoration(
                                            icon: Icon(Icons.date_range,
                                              color: Colors.red,),
                                            border: InputBorder.none,
                                            hintText: formatDate(nascimento,
                                                [dd, "-", mm, "-", yyyy])
                                                .toString(),
                                            hintStyle: TextStyle(
                                                color: Colors.red,
                                                fontSize: 15),
                                            contentPadding: EdgeInsets.only(
                                                top: 30,
                                                bottom: 30,
                                                right: 30,
                                                left: 5
                                            )
                                        ),

                                      ),
                                    )
                                ),
                                //------------------------------------ ------------------------------------------------------------------------------------------------------
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.redAccent,
                                              width: 0.5
                                          )
                                      )
                                  ),
                                  child: TextFormField(
                                    obscureText: false,
                                    controller: _controlEmail,
                                    style: TextStyle(
                                        color: Colors.red
                                    ),
                                    decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.email, color: Colors.redAccent,),
                                        border: InputBorder.none,
                                        hintText: "Email",
                                        suffixIcon: IconButton(
                                          onPressed: () => _controlEmail.clear(),
                                          icon: Icon(Icons.clear,color: Colors.red,),
                                        ),
                                        hintStyle: TextStyle(
                                            color: Colors.redAccent, fontSize: 15),
                                        contentPadding: EdgeInsets.only(
                                            top: 30,
                                            bottom: 30,
                                            right: 30,
                                            left: 5
                                        )
                                    ),
                                  ),
                                ),

                                //------------------------------------ ------------------------------------------------------------------------------------------------------
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.redAccent,
                                              width: 0.5
                                          )
                                      )
                                  ),
                                  child: TextField(
                                    controller: _controlSenha,
                                    obscureText: true,
                                    style: TextStyle(
                                        color: Colors.redAccent
                                    ),
                                    decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.lock, color: Colors.redAccent,),
                                        border: InputBorder.none,
                                        hintText: "Senha",
                                        hintStyle: TextStyle(
                                            color: Colors.redAccent, fontSize: 15),
                                        contentPadding: EdgeInsets.only(
                                            top: 30,
                                            bottom: 30,
                                            right: 30,
                                            left: 5
                                        )
                                    ),
                                  ),
                                ),
                                //------------------------------------ ------------------------------------------------------------------------------------------------------
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.redAccent,
                                              width: 0.5
                                          )
                                      )
                                  ),
                                  child: TextFormField(
                                    controller: _controlConfirmSenha,
                                    obscureText: true,
                                    style: TextStyle(
                                        color: Colors.redAccent
                                    ),
                                    decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.lock, color: Colors.redAccent,),
                                        border: InputBorder.none,
                                        hintText: "Repetir Senha",
                                        hintStyle: TextStyle(
                                            color: Colors.redAccent, fontSize: 15),
                                        contentPadding: EdgeInsets.only(
                                            top: 30,
                                            bottom: 30,
                                            right: 30,
                                            left: 5
                                        )
                                    ),
                                  ),
                                ),
                                //------------------------------------ ------------------------------------------------------------------------------------------------------
                                Container(
                                    child: CheckboxListTile(
                                      title: Text(
                                        "Concordo com o termo de usos do app",
                                      ),
                                      value: _checkedtermos,
                                      activeColor: Colors.white,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _checkedtermos = true;
                                        });
                                      },
                                      checkColor: Colors.red,
                                      controlAffinity: ListTileControlAffinity
                                          .leading,
                                    )
                                ),
                                //------------------------------------ ------------------------------------------------------------------------------------------------------
                                Container(
                                  margin: EdgeInsets.all(20.0),
                                  height: 70,
                                  width: 250,
                                  child: RaisedButton(
                                    child: const Text(
                                      "Registrar-se", textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20),),
                                    onPressed: () {

                                      OnRegisterClick();
                                    },
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(
                                            30.0)),
                                    textColor: Colors.white,
                                    color: Colors.redAccent,
                                  ),
                                ),

                                //------------------------------------ ------------------------------------------------------------------------------------------------------
                                GestureDetector(
                                  child: Container(
                                    child: Text(
                                      "Ja possui Conta?",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 15),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> Login() ));
                                  },
                                ),
                                Divider(),
                                //------------------------------------ ------------------------------------------------------------------------------------------------------
                                GestureDetector(
                                  child: Container(
                                    child: Text(
                                      "Termos de Uso do app",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 19),
                                    ),
                                  ),
                                  onTap: () {
                                    showAlertDialogtermos(context);
                                  },
                                ),
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
        ),

    );

  }


  String _validateNome(String text) {
    print(text);
    print(text.length);
    if (text.length <= 3 || text.length > 100) {
      return "O nome deve possuir mais de 3 caracteres e menos de 100 caracteres";
    }
    if (text.contains(new RegExp(r'[0-9]'))) {
      return "O nome não deve possuir caracteres numéricos";
    }
    return null;
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


  void OnRegisterClick() {
    String nameUser = _controlNome.text.toString();
    String emailUser = _controlEmail.text.toString();
    print(emailUser);
    String senhaUser = _controlSenha.text.toString();
    String confsenhaUser = _controlConfirmSenha.text.toString();
    //int sexUser = 0 ;
    print(senhaUser);

    if (_validateNome(nameUser) !=  null){
      AlertSnackBar(_validateNome(nameUser), _controlNome,true);
      return;}
    if (_validateEmail(emailUser) != null){
      AlertSnackBar(_validateEmail(emailUser), _controlEmail,true);
      return;}
    if (_checkMasculino == true) {_controlSex = "M"; } else {_controlSex = "F";}
    if (_validateSenha(senhaUser) != null){
      AlertSnackBar(_validateSenha(senhaUser), _controlSenha,true);
      return;}
    if (senhaUser != confsenhaUser){
      AlertSnackBar("A confirmação de senha deve ser igual a senha", _controlConfirmSenha,true);
      return;}

    if (_checkedtermos == false){
      AlertSnackBar("Por favor aceite os termos de Uso", _controlConfirmSenha,false);
      return;
    }

    createUser();
  }

  showAlertDialogtermos(BuildContext context) {
    Widget naoButton = FlatButton(
      child: Text("ok"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text('Termos de Uso', textScaleFactor: 2),
      content: Container(
        height: 400,
        width: 300,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                  constant.termosUso()
              ),
            ],
          ),
        ),
      ),
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
  showAlertDialogErro(BuildContext context, String alerta) {
    Widget naoButton = FlatButton(
      child: Text("Ok!", style: TextStyle(color: Colors.amberAccent)),
      onPressed:  () {Navigator.of(context).pop();},
    );
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      backgroundColor: Colors.red,
      title: Text("Opa !", style: TextStyle(color: Colors.white),),
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
  void AlertSnackBar(String alert, TextEditingController control, bool check){
    showAlertDialogErro(context, alert);
    if (check == true){control.clear();}
  }
}
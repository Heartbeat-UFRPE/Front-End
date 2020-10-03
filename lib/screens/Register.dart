import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:heartbeat/Constant.dart' ;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  Constant constant = Constant();
  final _controlNome = TextEditingController();
  final _controlEmail = TextEditingController();
  final _controlSenha = TextEditingController();
  final _controlConfirmSenha = TextEditingController();
  bool _checkedtermos = false;
  final GlobalKey<FormState> _globalRegisterKey = GlobalKey<FormState>();

  DateTime nascimento = DateTime.utc(2000, 01, 01);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Form(
        key: _globalRegisterKey,
        child: Container(
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
                                            color: Colors.white70,
                                            width: 0.5
                                        )
                                    )
                                ),
                                child: TextFormField(
                                  obscureText: true,
                                  keyboardType: TextInputType.name,
                                  controller: _controlNome,
                                  validator: _validateNome,
                                  style: TextStyle(
                                      color: Colors.white70
                                  ),
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.navigation, color: Colors.white70,),
                                      border: InputBorder.none,
                                      hintText: "Nome",
                                      hintStyle: TextStyle(
                                          color: Colors.white70, fontSize: 15),
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
                                              color: Colors.white70,
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
                                            color: Colors.white70,),
                                          border: InputBorder.none,
                                          hintText: formatDate(nascimento,
                                              [dd, "/", mm, "/", yyyy])
                                              .toString(),
                                          hintStyle: TextStyle(
                                              color: Colors.white70,
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
                                            color: Colors.white70,
                                            width: 0.5
                                        )
                                    )
                                ),
                                child: TextFormField(
                                  obscureText: false,
                                  controller: _controlEmail,
                                  validator: _validateEmail,
                                  style: TextStyle(
                                      color: Colors.white70
                                  ),
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.email, color: Colors.white70,),
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                          color: Colors.white70, fontSize: 15),
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
                                            color: Colors.white70,
                                            width: 0.5
                                        )
                                    )
                                ),
                                child: TextFormField(
                                  controller: _controlSenha,
                                  obscureText: true,
                                  validator: _validateSenha,
                                  style: TextStyle(
                                      color: Colors.white70
                                  ),
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.lock, color: Colors.white70,),
                                      border: InputBorder.none,
                                      hintText: "Senha",
                                      hintStyle: TextStyle(
                                          color: Colors.white70, fontSize: 15),
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
                                            color: Colors.white70,
                                            width: 0.5
                                        )
                                    )
                                ),
                                child: TextFormField(
                                  controller: _controlConfirmSenha,

                                  obscureText: true,
                                  style: TextStyle(
                                      color: Colors.white70
                                  ),
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.lock, color: Colors.white70,),
                                      border: InputBorder.none,
                                      hintText: "Repetir Senha",
                                      hintStyle: TextStyle(
                                          color: Colors.white70, fontSize: 15),
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

                                  },
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          30.0)),
                                  textColor: Colors.red,
                                  color: Colors.white,
                                ),
                              ),
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
      )
    );

  }


  String _validateNome(String text) {
    if (text.length < 3 || text.length > 100) {
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
    if (senha.contains(new RegExp(r'[a-z]')) == false ||
        senha.contains(new RegExp(r'[A-Z]')) == false) {
      return "A senha deve possuir Letras";
    }
    if (senha.contains(new RegExp(r'[0-9]')) == false) {
      return "A senha deve possuir caracteres numéricos";
    }
    return null;
  }

  String _validateConfirmSenha(String Confirmsenha, String senha) {
    if (Confirmsenha != senha) {
      return "A confirmação de senha deve coincidir com a senha";
    }
    return null;
  }

  _OnRegisterClick(BuildContext context) {
    final String nameUser = _controlNome.text.toString();
    final String emailUser = _controlEmail.text.toString();
    final String senhaUser = _controlSenha.text.toString();
    final String confsenhaUser = _controlConfirmSenha.text.toString();

    if (!_globalRegisterKey.currentState.validate()) {}
    return;
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
}
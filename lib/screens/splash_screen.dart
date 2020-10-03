import 'package:flutter/material.dart';
import 'package:heartbeat/screens/login.dart';
import 'package:heartbeat/screens/Register.dart';
import 'package:flare_flutter/flare_actor.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: FlareActor(
            "assets/heart.flr",animation: "Untitled",
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) => {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=>Login()
      ))
    });
  }
}


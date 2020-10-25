import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heartbeat/Constant.dart';
import "dart:math";

import 'package:heartbeat/screens/components/custom_drawer.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _frases = Constant().frases();

  final random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xffbf4747),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FaIcon(FontAwesomeIcons.bookMedical,size: 30,)
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child:
                  Text(_frases[random.nextInt(_frases.length)],
                    textAlign: TextAlign.center,
                    style: TextStyle(),),
                )
              ],
            )
          ],
        )
    );
  }
}

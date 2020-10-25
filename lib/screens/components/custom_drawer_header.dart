import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heartbeat/screens/CRUD/Configuration.dart';

class CustomDrawerHeader extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> Configuration())),
      child: Container(
        color: Color(0xffbf4747),
        height: 95,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FaIcon(FontAwesomeIcons.userAlt,color: Colors.black54,size: 33,),
            ),
            Expanded(
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Bem vindo",style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


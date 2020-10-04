import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:heartbeat/screens/splash_screen.dart';
import 'package:heartbeat/stores/page_store.dart';

void main() {
  setLocator();
  runApp(MyApp());
}

void setLocator(){
  GetIt.I.registerSingleton(PageStore());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heartbeat',
      theme: ThemeData(
        primaryColor: Color(0xffbf4747),
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home:Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}



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
      home:Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}


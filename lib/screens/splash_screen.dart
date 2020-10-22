import 'package:flutter/material.dart';
import 'package:heartbeat/screens/home.dart';
import 'package:heartbeat/screens/login.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:heartbeat/screens/temp.dart';
import 'package:charts_flutter/flutter.dart' as charts;


 List<charts.Series<LinearSales, int>> _createSampleData() {
final data = [
new LinearSales(0, 5),
new LinearSales(1, 25),
new LinearSales(2, 100),
new LinearSales(3, 75),
];

return [
new charts.Series<LinearSales, int>(
id: 'Sales',
domainFn: (LinearSales sales, _) => sales.year,
measureFn: (LinearSales sales, _) => sales.sales,
data: data,
)
];
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  FlutterSecureStorage _storage = FlutterSecureStorage();
  String _token = '';

  Future<String> _getToken() async{
    print(await _storage.read(key: "token"));
    return await _storage.read(key: "token");

  }

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

    _getToken().then((value) => _token = value);

    Future.delayed(Duration(seconds: 3)).then((value) => {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=> (_token == null) ? Login() : LineAnimationZoomChart(_createSampleData())
      ))
    });
  }
}


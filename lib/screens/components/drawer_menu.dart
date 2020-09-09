import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:heartbeat/screens/components/drawer_menu_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heartbeat/screens/drawer_screens/blood_pressure.dart';
import 'package:heartbeat/screens/drawer_screens/blood_pressure_graph.dart';
import 'package:heartbeat/stores/page_store.dart';



class DrawerMenu extends StatelessWidget {

  final PageStore _pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DrawerMenuItem(title: "Peso e pressão arterial de hoje",
          icon: FontAwesomeIcons.weight,
          function: (){
            _pageStore.setPage(0);
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => MeasurePressure()));
          },
          selected: _pageStore.page == 0,
      ),
        Divider(),
        DrawerMenuItem(title: "Gráfico de pressão arterial",
          icon: FontAwesomeIcons.chartLine,
          function: (){
            _pageStore.setPage(1);
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => BloodPressureGraph()));
          },
          selected: _pageStore.page == 1,
        ),
        Divider(),
        DrawerMenuItem(title: "Gráfico de peso",
          icon: FontAwesomeIcons.chartArea,
          function: (){
            _pageStore.setPage(2);
          },
          selected: _pageStore.page == 2,
        )
      ],
    );
  }
}

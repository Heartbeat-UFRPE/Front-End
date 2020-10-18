import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:heartbeat/screens/components/drawer_menu_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heartbeat/screens/drawer_screens/blood_pressure_graph.dart';
import 'package:heartbeat/screens/drawer_screens/weight_graph.dart';
import 'package:heartbeat/stores/page_store.dart';



class DrawerMenu extends StatelessWidget {

  final PageStore _pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DrawerMenuItem(title: "Pressão arterial",
          icon: FontAwesomeIcons.weight,
          function: (){
            _pageStore.setPage(0);
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => BloodPressureGraph()));
          },
          selected: _pageStore.page == 0,
      ),
        Divider(),
        DrawerMenuItem(title: "Peso",
          icon: FontAwesomeIcons.balanceScaleLeft,
          function: (){
            _pageStore.setPage(1);
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => WeightGraph()));
          },
          selected: _pageStore.page == 1,
        ),
        Divider(),
//        DrawerMenuItem(title: "Gráfico de peso",
//          icon: FontAwesomeIcons.chartArea,
//          function: (){
//            Navigator.of(context).pop();
//            _pageStore.setPage(2);
//          },
//          selected: _pageStore.page == 2,
//        )
      ],
    );
  }
}

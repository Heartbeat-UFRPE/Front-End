import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:heartbeat/screens/Cardapio/Cardapio.dart';
import 'package:heartbeat/screens/components/drawer_menu_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heartbeat/stores/page_store.dart';

import '../login.dart';


<<<<<<< HEAD

class DrawerMenu extends StatefulWidget {

=======
class DrawerMenu extends StatefulWidget {

>>>>>>> stable
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final PageStore _pageStore = GetIt.I<PageStore>();
  FlutterSecureStorage _storage = FlutterSecureStorage();



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(),
        DrawerMenuItem(title: "Cardápio",
          icon: FontAwesomeIcons.breadSlice,
          function: (){
            Navigator.of(context).pop();
            _pageStore.setPage(0);
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => Cardapio()));
          },
          selected: _pageStore.page == 1,
        ),
        Divider(),
        DrawerMenuItem(title: "Sair",
          icon: Icons.exit_to_app,
          function: (){

            Navigator.of(context).pop();
            _pageStore.setPage(1);
            exitApp();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Login()),
            );
          },
          selected: _pageStore.page == 2,
        ),
      ],
    );
  }
  exitApp() async{
    await _storage.deleteAll();
  }
}



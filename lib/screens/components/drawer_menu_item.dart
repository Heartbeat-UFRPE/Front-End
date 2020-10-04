import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerMenuItem extends StatelessWidget {

  DrawerMenuItem({this.title, this.icon, this.function, this.selected});

  final String title;
  final IconData icon;
  final VoidCallback function;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,style:
        TextStyle(color: selected ? Color(0xffbf4747) : Colors.black54,fontWeight: FontWeight.w700),),
      leading: FaIcon(icon,color: selected ? Color(0xffbf4747) : Colors.black54,),
      onTap: function,
    );
  }
}

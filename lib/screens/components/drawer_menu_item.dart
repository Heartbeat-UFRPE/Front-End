import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerMenuItem extends StatefulWidget {

  DrawerMenuItem({this.title, this.icon, this.function, this.selected});

  final String title;
  final IconData icon;
  final VoidCallback function;
  final bool selected;

  @override
  _DrawerMenuItemState createState() => _DrawerMenuItemState();
}

class _DrawerMenuItemState extends State<DrawerMenuItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title,style:
        TextStyle(color: widget.selected ? Color(0xffbf4747) : Colors.black54,fontWeight: FontWeight.w700),),
      leading: FaIcon(widget.icon,color: widget.selected ? Color(0xffbf4747) : Colors.black54,),
      onTap: widget.function,
    );
  }
}

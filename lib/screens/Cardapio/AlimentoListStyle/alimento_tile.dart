
import 'package:flutter/material.dart';

import '../Alimento.dart';

class AlimentoTile extends StatelessWidget {



  final Alimento alimento;
  const AlimentoTile(this.alimento);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: myBoxDecoration(),
          child: ListTile(
      title: Text(alimento.comida , style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text(alimento.quantidade),
      trailing: Text(alimento.Kcal.toString() + " Kcal"),
    ));

  }


}
BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border(bottom: BorderSide(
      color: Colors.red,
      width: 0.4,
    ), )
  );
}

import 'package:flutter/material.dart';

class Alimento {
  final String comida;
  final String quantidade;
  final int Kcal;

  const Alimento({
    @required this.comida,
    @required this.Kcal,
    this.quantidade,
  });
}
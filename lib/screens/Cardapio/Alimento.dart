
import 'package:flutter/material.dart';

class Alimento {
  final String nome;
  final String quantidade;
  final int Kcal;
  final int fase_dia;

  const Alimento({
    @required this.nome,
    @required this.Kcal,
    @required this.fase_dia,
    this.quantidade,
  });
}
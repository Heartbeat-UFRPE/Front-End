
import 'package:flutter/material.dart';

class User {
  final String name;
  final String password;
  final String email;

  const User({
    @required this.name,
    @required this.password,
    @required this.email,
  });
}
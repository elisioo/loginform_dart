import 'package:flutter/material.dart';

var txtstyle = const TextStyle(
  fontSize: 38,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
);

var txtstyle2 = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.5,
  color: Colors.white,
);

var txtstyle3 = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  letterSpacing: 1.2,
  color: Colors.blue,
);

var btnstyle = ElevatedButton.styleFrom(
  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  minimumSize: const Size.fromHeight(50),
  backgroundColor: Colors.green[400],
);

var errortxtstyle = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: Colors.red,
  letterSpacing: 1,
);

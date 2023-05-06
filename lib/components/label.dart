import 'package:flutter/material.dart';

Widget label(String text) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2), color: Colors.grey.shade700),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
    ),
  );
}

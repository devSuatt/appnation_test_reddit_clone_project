// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Row showDownButtons() {
  return Row(
    // ignore: prefer_const_literals_to_create_immutables
    children: [
      Icon(Icons.share),
      Text("Share"),
      SizedBox(
        width: 20,
      ),
      Icon(Icons.bookmark_outline_outlined),
      Text("Save"),
      SizedBox(
        width: 20,
      ),
      Icon(Icons.flag_outlined),
      Text("Report"),
    ],
  );
}

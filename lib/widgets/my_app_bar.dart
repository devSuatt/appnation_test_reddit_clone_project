// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

AppBar myAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Image.asset(
      "assets/reddit.png",
      height: 40,
    ),
    actions: [
      Container(
        margin: EdgeInsets.only(right: 20),
        child: Icon(Icons.search, color: Colors.black),
      ),
      Container(
        margin: EdgeInsets.only(right: 20),
        child: Icon(Icons.person, color: Colors.black),
      ),
    ],
  );
}



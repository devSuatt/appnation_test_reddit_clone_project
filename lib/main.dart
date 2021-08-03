// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:appnation_test_reddit_clone_project/views/reddit_data_view.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: RedditDataView(),
    );
  }
}
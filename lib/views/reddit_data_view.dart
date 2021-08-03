// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print

import 'dart:convert';
import 'package:appnation_test_reddit_clone_project/widgets/down_buttons.dart';
import 'package:appnation_test_reddit_clone_project/widgets/my_app_bar.dart';
import 'package:http/http.dart' as http;
import 'package:appnation_test_reddit_clone_project/models/reddit_data.dart';
import 'package:appnation_test_reddit_clone_project/services/get_json_datas.dart';
import 'package:flutter/material.dart';

class RedditDataView extends StatefulWidget {
  const RedditDataView({Key? key}) : super(key: key);

  @override
  _RedditDataViewState createState() => _RedditDataViewState();
}

void asd() async {
  final _response = await http.get(Uri.parse("https://www.reddit.com/r/flutterdev/top.json?count=20"));
  final _mapJson = json.decode(_response.body);
  print(_mapJson['data']['children'][1]['data']['name']);
}

class _RedditDataViewState extends State<RedditDataView> {
  @override
  Widget build(BuildContext context) {
    asd();
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: myAppBar(),
      body: Container(
        child: _redditDatasWidget,
      ),
    );
  }

  

  Widget get _redditDatasWidget => FutureBuilder<List<RedditData>>(
        future: GetJsonDatas().getRedditData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var data = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, int index) {
                RedditData myData = snapshot.data[index];
                return Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: showScoreOfReddit(myData, index),
                      ),
                      Expanded(
                        flex: 7,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(8, 0, 5, 0),
                          child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              showTitleOfReddit(myData, index),
                              myData.thumbnail != "self" && myData.thumbnail != "default"
                                  ? Image.network(myData.thumbnail, fit: BoxFit.fill)
                                  : Text(removeUrlSubStrings(myData.selftext)),
                              SizedBox(height: 15),
                              showDownButtons(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );

  Container showTitleOfReddit(RedditData myData, int index) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 12, 0, 12),
      alignment: Alignment.topLeft,
      child: Text(
        changeAmpersandChar(myData.title),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Container showScoreOfReddit(RedditData myData, int index) {
    return Container(
      margin: EdgeInsets.only(left: 3),
      color: Colors.grey[100],
      child: Column(
        children: [
          SizedBox(height: 10),
          Icon(Icons.arrow_circle_up),
          Text(myData.score.toString()),
          Icon(Icons.arrow_circle_down),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  String changeAmpersandChar(String text) {
    return text.replaceAll('&amp;', '&');
  }

  String removeUrlSubStrings(String text) {
    String newString = text.replaceAll(RegExp(r"(http|ftp|https)://([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?"), "");
    newString = newString.replaceAll("[", "").replaceAll("]", "").replaceAll("()", "");
    return newString;
  }
}

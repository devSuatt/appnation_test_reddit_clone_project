// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print

import 'package:appnation_test_reddit_clone_project/providers/reddit_provider.dart';
import 'package:appnation_test_reddit_clone_project/shared/down_buttons.dart';
import 'package:appnation_test_reddit_clone_project/shared/functions.dart';
import 'package:appnation_test_reddit_clone_project/shared/my_app_bar.dart';
import 'package:appnation_test_reddit_clone_project/models/reddit_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class RedditDataView extends StatefulWidget {
  const RedditDataView({Key? key}) : super(key: key);

  @override
  _RedditDataViewState createState() => _RedditDataViewState();
}

class _RedditDataViewState extends State<RedditDataView> {
  Functions myFunctions = Functions();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: myAppBar(),
      body: Container(
        child: _redditDatasWidget,
      ),
    );
  }

  Widget get _redditDatasWidget => ChangeNotifierProvider(
        create: (context) => RedditProvider(),
        child: Builder(builder: (context) {
          final _redditProvider = Provider.of<RedditProvider>(context);
          if (_redditProvider.pageState == PageState.Loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (_redditProvider.pageState == PageState.Error) {
            return Center(child: Text("An error occured: " + _redditProvider.errorMessage));
          }
          final redditDatas = _redditProvider.redditDatas;
          return ListView.builder(
            itemCount: redditDatas.length,
            itemBuilder: (context, int index) {
              RedditData myData = redditDatas[index];
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
                                : Text(myFunctions.removeUrlSubStrings(myData.selftext)),
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
        }),
      );

  Container showTitleOfReddit(RedditData myData, int index) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 12, 0, 12),
      alignment: Alignment.topLeft,
      child: Text(
        myFunctions.changeAmpersandChar(myData.title),
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

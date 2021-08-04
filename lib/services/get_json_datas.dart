// ignore_for_file: avoid_print, unnecessary_this, unnecessary_null_comparison

import 'dart:convert';
import 'package:appnation_test_reddit_clone_project/models/reddit_data.dart';
import 'package:http/http.dart' as http;

class GetJsonDatas {
  final _url = "https://www.reddit.com/r/flutterdev/top.json?count=20";
  static GetJsonDatas _instance = GetJsonDatas();
  GetJsonDatas();
  GetJsonDatas._();
  static GetJsonDatas get instance {
    // ignore: prefer_conditional_assignment
    if (_instance == null) {
      _instance = GetJsonDatas._();
    }
    return _instance;
  }

  Future<List<RedditData>> getRedditData() async {
    final _response = await http.get(Uri.parse(this._url));
    final _jsonData = json.decode(_response.body);
    var allRedditsJson = _jsonData['data']['children'];
    List<RedditData> allReddits = [];
    for(var r in allRedditsJson) {
      RedditData redditData = RedditData.fromJson(r['data']);
      allReddits.add(redditData);
    }
    return allReddits;
  }

}

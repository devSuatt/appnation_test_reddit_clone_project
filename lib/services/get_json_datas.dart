// ignore_for_file: avoid_print, unnecessary_this

import 'dart:convert';
import 'package:appnation_test_reddit_clone_project/models/reddit_data.dart';
import 'package:http/http.dart' as http;

class GetJsonDatas {

  final _url = "https://www.reddit.com/r/flutterdev/top.json?count=20";

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

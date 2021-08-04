// ignore_for_file: constant_identifier_names, prefer_final_fields, unused_field

import 'package:appnation_test_reddit_clone_project/models/reddit_data.dart';
import 'package:appnation_test_reddit_clone_project/services/get_json_datas.dart';
import 'package:flutter/widgets.dart';

enum PageState { Initialize, Loading, Loaded, Error }

class RedditProvider extends ChangeNotifier {
  PageState _pageState = PageState.Initialize;
  List<RedditData> redditDatas = [];
  String errorMessage = "";

  RedditProvider() { _fetchAllReddits(); }

  PageState get pageState => _pageState;

  Future<void> _fetchAllReddits() async {
    _pageState = PageState.Loading;
    try {
      final reddits = await GetJsonDatas.instance.getRedditData();
      redditDatas = reddits;
      _pageState = PageState.Loaded;
    } catch (e) {
      errorMessage = e.toString();
      _pageState = PageState.Error;
    }
    notifyListeners();
  }
}

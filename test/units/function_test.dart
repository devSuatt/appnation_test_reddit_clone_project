// ignore_for_file: prefer_const_constructors

import 'package:appnation_test_reddit_clone_project/models/reddit_data.dart';
import 'package:appnation_test_reddit_clone_project/services/get_json_datas.dart';
import 'package:appnation_test_reddit_clone_project/shared/functions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Functions function = Functions(); 

  test('Change ampersand char in a string', () {
    final result = function.changeAmpersandChar("test &amp; flutter");
    expect(result, "test & flutter");
  });

  test('Remove URL in a string', () {
    String s = "Click [here](https://flutter.dev), for more information.";
    final result = function.removeUrlSubStrings(s);
    expect(result, "Click here, for more information.");
  });

  test('Get Json Data', () async {
    final getJsonData = GetJsonDatas();
    final response = await getJsonData.getRedditData();

    expect(response is List<RedditData>, true);
  });

}
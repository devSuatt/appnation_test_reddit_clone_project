// ignore_for_file: unnecessary_this, prefer_collection_literals

import 'package:appnation_test_reddit_clone_project/models/reddit_data.dart';

class Reddit {
  late String kind;
  late RedditData data;

  Reddit({required this.kind, required this.data});

  Reddit.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    data = RedditData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['kind'] = this.kind;
    data['data'] = this.data.toJson();
    return data;
  }
}



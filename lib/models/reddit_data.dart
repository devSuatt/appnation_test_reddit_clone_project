// ignore_for_file: prefer_collection_literals

class RedditData {
  late String selftext;
  late String authorFullname;
  late String title;
  late String name;
  late int score;
  late String id;
  late int numComments;
  late String url;
  late String thumbnail;

  RedditData(
      {required this.selftext,
      required this.authorFullname,
      required this.title,
      required this.thumbnail,
      required this.name,
      required this.score,
      required this.id,
      required this.numComments,
      required this.url});

  RedditData.fromJson(Map<dynamic, dynamic> json) {
    selftext = json['selftext'];
    authorFullname = json['author_fullname'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    name = json['name'];
    score = json['score'];
    id = json['id'];
    numComments = json['num_comments'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['selftext'] = selftext;
    data['author_fullname'] = authorFullname;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    data['name'] = name;
    data['score'] = score;
    data['id'] = id;
    data['num_comments'] = numComments;
    data['url'] = url;
    return data;
  }
}
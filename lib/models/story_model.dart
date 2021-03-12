class StoryModel {
  final String id;
  final String author;
  final String url;
  final bool isSeen;
  final bool isLive;

  StoryModel({this.id, this.author, this.url, this.isSeen, this.isLive});

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
        id: map['id'],
        author: map['author'],
        url: map['download_url'],
        isSeen: map['author'].length > 8 ? true : false,
        isLive: map['author'].length > 15 ? true : false);
  }
}

class Stories {
  static List<StoryModel> stories = [];
}

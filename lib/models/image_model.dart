import 'package:flutter_assignment/models/user_model.dart';

class ImageModel {
  final String id;
  final String author;
  final String url;
  final bool isLiked;
  final int time;

  final User user;

  ImageModel(
      {this.id, this.author, this.url, this.isLiked, this.time, this.user});

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
        id: map['id'],
        author: map['author'],
        url: map['download_url'],
        isLiked: map['author'].length > 10 ? true : false,
        time: 20,
        user: User(
            map['download_url'],
            map['author'].length > 14 ? true : false,
            map['author'].length > 14 ? true : false));
  }
}

class Images {
  static List<ImageModel> images = [];
}

import 'dart:convert';

import 'package:flutter_assignment/models/image_model.dart';
import 'package:flutter_assignment/models/story_model.dart';
import 'package:http/http.dart' as http;

class Backend {
  List data = [];

  static Future<bool> getData() async {
    final String url = "https://picsum.photos/v2/list";

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      Images.images = List.from(decodedData)
          .map<ImageModel>((image) => ImageModel.fromMap(image))
          .toList();

      Stories.stories = List.from(decodedData)
          .map<StoryModel>((image) => StoryModel.fromMap(image))
          .toList();
      return true;
    } else {
      return false;
    }
  }
}

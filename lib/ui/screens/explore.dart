import 'package:flutter/material.dart';
import 'package:flutter_assignment/ui/components/my_image_list.dart';
import 'package:flutter_assignment/ui/components/my_story_list.dart';
import 'package:flutter_assignment/ui/components/user_post_upload.dart';
import 'package:flutter_assignment/utils/configs.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: SizeConfig.getWidth(100),
      height: SizeConfig.getHeight(93),
      color: white,
      child: Column(
        children: [
          MyStoryList(),
          UserPostUpload(),
          Divider(),
          MyImageList(),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/user_model.dart';
import 'package:flutter_assignment/ui/widgets/icon_container.dart';
import 'package:flutter_assignment/ui/widgets/my_text.dart';
import 'package:flutter_assignment/utils/configs.dart';

class UserPostUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.getHeight(7),
      width: SizeConfig.getWidth(100),
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.getWidth(4),
          vertical: SizeConfig.getHeight(1)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: CircleAvatar(
              maxRadius: 20,
              backgroundImage: NetworkImage(CurrentUserData.userData.imageUrl),
            ),
          ),
          SizedBox(
            width: SizeConfig.getWidth(4),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: lightGrey, width: 1),
                  borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                child: MyText(
                  text: "What do you think?",
                  size: 16,
                  color: lightGrey,
                ),
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.getWidth(4),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconContainer(icon: Icons.photo_library),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/image_model.dart';
import 'package:flutter_assignment/models/user_model.dart';
import 'package:flutter_assignment/ui/screens/common_screen_preview.dart';
import 'package:flutter_assignment/ui/widgets/icon_container.dart';
import 'package:flutter_assignment/ui/widgets/my_text.dart';
import 'package:flutter_assignment/utils/configs.dart';
import 'package:flutter_assignment/utils/screen_move_display_text.dart';

class MyImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: SizeConfig.getWidth(100),
        margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.getWidth(2),
        ),
        child: UserImageList(),
      ),
    );
  }
}

class UserImageList extends StatefulWidget {
  @override
  _UserImageListState createState() => _UserImageListState();
}

class _UserImageListState extends State<UserImageList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: Images.images.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ImageTile(
                image: Images.images[index],
              ),
              Divider(),
            ],
          );
        });
  }
}

class ImageTile extends StatelessWidget {
  final ImageModel image;

  const ImageTile({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
        child: Container(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            children: [
              buildFirst(context),
              VerticalSpacing(of: 0.4),
              Expanded(
                  child: Container(
                width: SizeConfig.getWidth(100),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    image.url,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
              VerticalSpacing(of: 0.6),
              buildThird(),
            ],
          ),
        )),
      ),
    );
  }

  Widget buildFirst(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScreenPreview(text: ScreenText.seeStory);
                  }));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: image.user.isStory
                              ? greenColor
                              : Colors.transparent,
                          width: 4)),
                  child: CircleAvatar(
                    maxRadius: 22,
                    backgroundImage:
                        NetworkImage(image.user.userProfileImageUrl),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(text: image.author, size: 20),
                  Row(
                    children: [
                      MyText(text: "${image.time} Min ago", size: 12),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.circle,
                          size: 6,
                        ),
                      ),
                      Icon(
                        Icons.group,
                        size: 18,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.add_circle,
              size: 36,
              color: image.isLiked ? redColor : black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildThird() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: CircleAvatar(
              maxRadius: 16,
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
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: MyText(
                  text: "Say Something",
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
            child: IconContainer(icon: Icons.share, size: 22),
          )
        ],
      ),
    );
  }
}

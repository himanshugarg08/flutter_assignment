import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/story_model.dart';
import 'package:flutter_assignment/models/user_model.dart';
import 'package:flutter_assignment/ui/screens/common_screen_preview.dart';
import 'package:flutter_assignment/ui/widgets/my_text.dart';
import 'package:flutter_assignment/utils/configs.dart';
import 'package:flutter_assignment/utils/screen_move_display_text.dart';

class MyStoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.getHeight(16),
      width: SizeConfig.getWidth(100),
      margin: EdgeInsets.symmetric(vertical: SizeConfig.getHeight(0.5)),
      child: StoryList(),
    );
  }
}

class StoryList extends StatefulWidget {
  @override
  _StoryListState createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
      ),
      child: ListView.builder(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          itemCount: Stories.stories.length + 1,
          itemBuilder: (context, index) {
            return index == 0
                ? UserStoryTile()
                : StoryTile(
                    story: Stories.stories[index - 1],
                  );
          }),
    );
  }
}

class StoryTile extends StatelessWidget {
  final StoryModel story;

  const StoryTile({Key key, @required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: GestureDetector(
          onTap: () {
            if (story.isLive) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ScreenPreview(text: ScreenText.livePreview);
              }));
            } else {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ScreenPreview(text: ScreenText.seeStory);
              }));
            }
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(story.url)),
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  border: Border.all(
                    color: story.isLive
                        ? redColor
                        : (story.isSeen ? darkGrey : kPrimaryColor),
                    width: 3.5,
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: MyText(
                    text: story.author,
                    size: 12,
                    color: white,
                    align: TextAlign.center,
                  ),
                ),
              ),
              story.isLive
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: redColor),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 2.0),
                            child: MyText(
                              text: "Live",
                              size: 16,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

class UserStoryTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: AspectRatio(
        aspectRatio: 0.8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ScreenPreview(text: ScreenText.addStory);
              }));
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(CurrentUserData.userData.imageUrl)),
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  ),
                ),
                Center(
                    child: Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: white),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.add,
                      size: 28,
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

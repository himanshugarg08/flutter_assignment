import 'package:flutter/material.dart';
import 'package:flutter_assignment/backend/backend.dart';
import 'package:flutter_assignment/ui/components/my_bottom_nav.dart';
import 'package:flutter_assignment/ui/screens/explore.dart';
import 'package:flutter_assignment/ui/widgets/icon_container.dart';
import 'package:flutter_assignment/ui/widgets/my_text.dart';
import 'package:flutter_assignment/utils/configs.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedItem = 0;
  PageController _myPageController = PageController();

  Future<bool> _myFuture;

  @override
  void initState() {
    _myFuture = Backend.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FutureBuilder(
        future: _myFuture,
        builder: (context, data) {
          if (data.hasError) {
            return Scaffold(
              body: Center(
                child: MyText(
                    text:
                        "Something Went Wrong! Please Make Sure that You are connected to the Internet.",
                    size: 24),
              ),
            );
          } else if (data.hasData && data.data == true) {
            return Scaffold(
                backgroundColor: white,
                bottomNavigationBar: MyBottomNavBar(
                  selectedItem: _selectedItem,
                  onChange: (value) {
                    setState(() {
                      _selectedItem = value;
                      _myPageController.jumpToPage(_selectedItem);
                    });
                  },
                ),
                appBar: AppBar(
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: MyText(
                      text: "Feed",
                      size: 34,
                      color: kPrimaryColor,
                      weight: FontWeight.w600,
                    ),
                  ),
                  actions: [
                    IconContainer(icon: Icons.search),
                    IconContainer(icon: Icons.mail),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                body: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _myPageController,
                  children: [
                    ExplorePage(),
                    Center(
                      child: MyText(
                        text: 'Group Details Will Appear here.',
                        size: 24,
                      ),
                    ),
                    Center(
                      child: MyText(
                        text: 'Videos Will Appear here.',
                        size: 24,
                      ),
                    ),
                    Center(
                      child: MyText(
                        text: 'Notifications Will Appear here.',
                        size: 24,
                      ),
                    ),
                    Center(
                      child: MyText(
                        text: 'User Details Will Appear here.',
                        size: 24,
                      ),
                    ),
                  ],
                ));
          } else if (data.data == false) {
            return Scaffold(
              body: Center(
                child: MyText(
                    text:
                        "Something Went Wrong! Please Make Sure that You are connected to the Internet.",
                    size: 24),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

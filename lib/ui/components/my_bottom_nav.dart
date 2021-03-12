import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/configs.dart';

class MyBottomNavBar extends StatefulWidget {
  final int selectedItem;
  final Function(int) onChange;

  const MyBottomNavBar(
      {Key key, this.selectedItem = 0, @required this.onChange})
      : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedItem;
  }

  buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onChange(index);
          _selectedIndex = index;
        });
      },
      child: Container(
        child: Column(
          children: [
            Container(
              height: 4,
              width: SizeConfig.getWidth(12),
              color: index == _selectedIndex ? kPrimaryColor : white,
            ),
            VerticalSpacing(of: 1),
            Container(
              height: SizeConfig.getHeight(4),
              width: SizeConfig.getWidth(20),
              child: Center(
                  child: Icon(
                icon,
                color: index == _selectedIndex ? kPrimaryColor : darkGrey,
                size: 28,
              )),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.getHeight(7),
      width: SizeConfig.getWidth(100),
      child: Row(
        children: [
          buildNavBarItem(Icons.explore, 0),
          buildNavBarItem(Icons.group, 1),
          buildNavBarItem(Icons.video_library, 2),
          buildNavBarItem(Icons.notifications, 3),
          buildNavBarItem(Icons.account_circle, 5),
        ],
      ),
    );
  }
}

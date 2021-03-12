import 'package:flutter/material.dart';
import 'package:flutter_assignment/ui/widgets/my_icon.dart';
import 'package:flutter_assignment/utils/configs.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  final double size;

  const IconContainer({Key key, @required this.icon, this.size = 30})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: extraLightGrey,
        ),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.getWidth(1.4)),
          child: MyIcon(
            icon: icon,
            size: size,
            color: darkGrey,
          ),
        ),
      ),
    );
  }
}

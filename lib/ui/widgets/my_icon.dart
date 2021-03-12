import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/configs.dart';

class MyIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;

  const MyIcon(
      {Key key, @required this.icon, @required this.size, this.color = black})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}

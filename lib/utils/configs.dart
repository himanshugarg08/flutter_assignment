import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0xFF595cd7);
const kSecondaryColor = Color(0xfff85655);
const greenColor = Color(0xffa4e6ab);
const redColor = Color(0xfffe5053);
const darkGrey = Color(0xff515151);
const extraLightGrey = Color(0xffeeeeee);
const lightGrey = Color(0xff9c9c9c);
const black = Color(0xff0a0a0a);
const white = Color(0xffffffff);

const kDefaultHeight = 2.0;

TextStyle textStyle(double size, FontWeight weight, Color color) {
  return //TextStyle(fontSize: size, fontWeight: weight, color: color);
      GoogleFonts.sourceSansPro(
          fontSize: size, fontWeight: weight, color: color);
}

class SizeConfig {
  static MediaQueryData mediaQuery;
  static double screenHeight;
  static double screenWidth;
  static double screenHeightWithPadding;
  static double screenWidthWithPadding;
  static double screenWidthPadding;
  static double screenHeightPadding;

  void init(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    screenHeight = mediaQuery.size.height;
    screenWidth = mediaQuery.size.width;
    screenWidthPadding = mediaQuery.padding.left + mediaQuery.padding.right;
    screenHeightPadding = mediaQuery.padding.top + mediaQuery.padding.bottom;
    screenHeightWithPadding = screenHeight - screenHeightPadding;
    screenWidthWithPadding = screenWidth - screenWidthPadding;
  }

  static double getHeight(double height) {
    return (screenHeightWithPadding / 100) * height;
  }

  static double getWidth(double width) {
    return (screenWidthWithPadding / 100) * width;
  }
}

class VerticalSpacing extends StatelessWidget {
  final double of;

  const VerticalSpacing({Key key, this.of = kDefaultHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.getHeight(of),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_assignment/ui/my_home_page.dart';
import 'package:flutter_assignment/utils/configs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          dividerTheme: DividerThemeData(
            color: extraLightGrey,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          )),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

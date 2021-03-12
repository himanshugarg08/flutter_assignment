import 'package:flutter/material.dart';
import 'package:flutter_assignment/ui/widgets/my_text.dart';

class ScreenPreview extends StatelessWidget {
  final String text;

  const ScreenPreview({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyText(text: text, size: 24),
      ),
    );
  }
}

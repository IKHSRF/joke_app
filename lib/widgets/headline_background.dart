import 'package:flutter/material.dart';
import 'package:joke_app/const.dart';

class HeadlineBackground extends StatelessWidget {
  const HeadlineBackground({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .45,
      decoration: BoxDecoration(
        color: headlineColor,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class JokeField extends StatelessWidget {
  const JokeField({
    Key key,
    @required this.textContent,
    @required this.textHeadline,
  }) : super(key: key);

  final textContent;
  final textHeadline;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          //headline for joke field
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            alignment: Alignment.centerLeft,
            child: Text(textHeadline, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          //content for joke field
          Container(
            alignment: Alignment.centerLeft,
            child: Text(textContent),
          ),
        ],
      ),
    );
  }
}

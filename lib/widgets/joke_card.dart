import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joke_app/const.dart';
import 'package:joke_app/widgets/joke_dialog_content.dart';

class JokeCard extends StatelessWidget {
  const JokeCard({
    Key key,
    @required this.snapshot,
    @required this.index,
  }) : super(key: key);
  final snapshot;
  final index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
          title: snapshot.data[index].type.toUpperCase(),
          titleStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          content: Column(
            children: [
              JokeField(
                textContent: snapshot.data[index].setup,
                textHeadline: 'Setup : ',
              ),
              JokeField(
                textContent: snapshot.data[index].punchline,
                textHeadline: 'Punchline : ',
              ),
            ],
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 17,
                spreadRadius: -13,
                color: shadowColor,
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                color: headlineColor,
                child: Text(
                  snapshot.data[index].type.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(snapshot.data[index].setup),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

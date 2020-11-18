import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeadlineContent extends StatelessWidget {
  const HeadlineContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Where There's \na Joke, \nThere's a Hope",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                icon: Icon(
                  Icons.search,
                ),
              ),
              onTap: () {
                Get.snackbar(
                  'Mohon Maaf',
                  'Fitur Search Belum Didukung',
                  colorText: Colors.white,
                  backgroundColor: Colors.red,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

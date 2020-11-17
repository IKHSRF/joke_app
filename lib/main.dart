import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joke_app/screens/joke/joke.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/jokePage',
      getPages: [
        GetPage(
          name: '/jokePage',
          page: () => JokePage(),
        ),
      ],
    );
  }
}

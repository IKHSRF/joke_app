import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joke_app/models/joke_model.dart';

class JokePage extends StatefulWidget {
  @override
  _JokePageState createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('aplikasi ini hanyalah joke'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_outlined),
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: Joke.getRandomTenJoke(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  var document = snapshot.data[index];
                  return ListTile(
                    title: Text(document.setup),
                    onTap: () {
                      Get.defaultDialog(
                        title: document.type.toUpperCase(),
                        titleStyle: TextStyle(fontWeight: FontWeight.bold),
                        content: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10.0),
                                    alignment: Alignment.centerLeft,
                                    child: Text('Setup : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    child: Text(document.setup),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10.0),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Punchline : ',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    child: Text(document.punchline),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

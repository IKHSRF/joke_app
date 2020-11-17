import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joke_app/models/joke_model.dart';
import 'package:joke_app/widgets/joke_dialog_content.dart';

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
        title: Text('Aplikasi ini hanyalah bercandaan'),
        actions: [
          //button refresh, if button tapped, refresh the joke
          IconButton(
            icon: Icon(Icons.refresh_outlined),
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      ),
      body: Container(
        //return snapshot from joke model
        child: FutureBuilder(
          future: Joke.getRandomTenJoke(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //if snapshot do not have data, show circular progress indicator
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            //if snapshot have data, show list of joke
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              //building list from future builder snapshot
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  var document = snapshot.data[index];
                  //show list of joke in tile
                  return ListTile(
                    title: Text(document.setup),
                    onTap: () {
                      //show joke dialog
                      Get.defaultDialog(
                        title: document.type.toUpperCase(),
                        titleStyle: TextStyle(fontWeight: FontWeight.bold),
                        content: Column(
                          children: [
                            //this for setup field
                            JokeField(
                              textContent: document.setup,
                              textHeadline: 'Setup : ',
                            ),
                            //this for punchline field
                            JokeField(
                              textContent: document.punchline,
                              textHeadline: 'Punchline : ',
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

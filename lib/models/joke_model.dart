import 'dart:convert';
import 'package:http/http.dart' as http;

class Joke {
  final int id;
  final String type;
  final String setup;
  final String punchline;

  //constructor for class Joke
  Joke({
    this.id,
    this.type,
    this.setup,
    this.punchline,
  });

  //function for get 10 random joke from joke API
  static Future<List<Joke>> getRandomTenJoke() async {
    var result = await http.get('https://official-joke-api.appspot.com/random_ten');
    var jsonResult = json.decode(result.body);

    List<Joke> jokes = [];

    //loop all json result then add to list of joke
    for (var i in jsonResult) {
      Joke joke = Joke(
        id: i['index'],
        type: i['type'],
        setup: i['setup'],
        punchline: i['punchline'],
      );
      jokes.add(joke);
    }

    //printing to console length of joke list
    print(jokes.length);

    //return list of joke
    return jokes;
  }
}

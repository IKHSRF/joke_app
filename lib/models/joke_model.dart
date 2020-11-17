import 'dart:convert';
import 'package:http/http.dart' as http;

class Joke {
  final int id;
  final String type;
  final String setup;
  final String punchline;

  Joke({
    this.id,
    this.type,
    this.setup,
    this.punchline,
  });

  static Future<List<Joke>> getRandomTenJoke() async {
    var result = await http.get('https://official-joke-api.appspot.com/random_ten');
    var jsonResult = json.decode(result.body);

    List<Joke> jokes = [];

    for (var i in jsonResult) {
      Joke joke = Joke(
        id: i['index'],
        type: i['type'],
        setup: i['setup'],
        punchline: i['punchline'],
      );
      jokes.add(joke);
    }

    print(jokes.length);
    return jokes;
  }

  static Future<List<Joke>> getRandomJoke() async {
    var result = await http.get('https://official-joke-api.appspot.com/random_joke');
    var jsonResult = json.decode(result.body);

    List<Joke> jokes = [];

    for (var i in jsonResult) {
      Joke joke = Joke(
        id: i['index'],
        type: i['type'],
        setup: i['setup'],
        punchline: i['punchline'],
      );
      jokes.add(joke);
    }

    print(jokes.length);
    return jokes;
  }
}

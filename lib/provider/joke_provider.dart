import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/joke.dart';

class JokeProvider with ChangeNotifier {
  Joke? _currentJoke;

  Joke? get currentJoke => _currentJoke;

  Future<void> fetchNewJoke() async {
    const url = 'https://official-joke-api.appspot.com/random_joke';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _currentJoke = Joke.fromJson(data);
        notifyListeners();
      } else {
        throw Exception('Failed to load joke');
      }
    } catch (error) {
      print('Error occurred: $error');
      _currentJoke = null;
      notifyListeners();
    }
  }
}

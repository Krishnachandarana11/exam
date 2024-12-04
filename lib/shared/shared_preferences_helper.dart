import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _likedJokesKey = 'liked_jokes';

  static Future<void> saveJoke(String joke) async {
    final prefs = await SharedPreferences.getInstance();
    final jokes = prefs.getStringList(_likedJokesKey) ?? [];
    jokes.add(joke);
    prefs.setStringList(_likedJokesKey, jokes);
  }

  static Future<List<String>> getLikedJokes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_likedJokesKey) ?? [];
  }

  static Future<void> removeJoke(String joke) async {
    final prefs = await SharedPreferences.getInstance();
    final jokes = prefs.getStringList(_likedJokesKey) ?? [];
    jokes.remove(joke);
    prefs.setStringList(_likedJokesKey, jokes);
  }
}

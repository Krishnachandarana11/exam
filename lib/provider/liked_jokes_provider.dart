import 'package:flutter/foundation.dart';

class LikedJokesProvider with ChangeNotifier {
  final List<String> _likedJokes = [];

  List<String> get likedJokes => _likedJokes;

  void addJoke(String joke) {
    if (!_likedJokes.contains(joke)) {
      _likedJokes.add(joke);
      notifyListeners();
    }
  }

  void removeJoke(String joke) {
    _likedJokes.remove(joke);
    notifyListeners();
  }
}

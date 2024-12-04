import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/joke_provider.dart';
import '../provider/liked_jokes_provider.dart';
import '../components/joke_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jokeProvider = Provider.of<JokeProvider>(context);
    final likedJokesProvider = Provider.of<LikedJokesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Joke App'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(context, '/liked-jokes');
            },
            tooltip: 'View Liked Jokes',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: jokeProvider.currentJoke == null
                    ? Text(
                  'Press the button below to fetch a joke!',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                  textAlign: TextAlign.center,
                )
                    : JokeCard(joke: jokeProvider.currentJoke!.joke),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => jokeProvider.fetchNewJoke(),
              icon: Icon(Icons.refresh),
              label: Text('Fetch Another Joke'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            SizedBox(height: 10),
            jokeProvider.currentJoke != null
                ? ElevatedButton.icon(
              onPressed: () {
                likedJokesProvider.addJoke(jokeProvider.currentJoke!.joke);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Joke added to favorites!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              icon: Icon(Icons.favorite),
              label: Text('Like This Joke'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

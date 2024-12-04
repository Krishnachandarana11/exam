import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/liked_jokes_provider.dart';


class LikedJokesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final likedJokesProvider = Provider.of<LikedJokesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Liked Jokes")),
      body: likedJokesProvider.likedJokes.isEmpty
          ? Center(child: Text("No Liked Jokes"))
          : ListView.builder(
        itemCount: likedJokesProvider.likedJokes.length,
        itemBuilder: (context, index) {
          final joke = likedJokesProvider.likedJokes[index];
          return ListTile(
            title: Text(joke),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                likedJokesProvider.removeJoke(joke);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Joke removed from favorites!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

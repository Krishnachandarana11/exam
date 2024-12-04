import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/joke_provider.dart';
import 'provider/liked_jokes_provider.dart';
import 'screens/liked_jokes.dart';
import 'screens/splash_screen.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => JokeProvider()),
        ChangeNotifierProvider(create: (_) => LikedJokesProvider()),
      ],
      child: MaterialApp(
        title: 'Joke App',
        debugShowCheckedModeBanner: false, // Removes the debug banner
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SplashScreen(),
        routes: {
          '/liked-jokes': (context) => LikedJokesPage(),
        },
      ),
    );
  }
}

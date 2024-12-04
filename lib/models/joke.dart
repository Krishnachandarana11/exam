class Joke {
  final String setup;
  final String punchline;

  Joke({required this.setup, required this.punchline});

  String get joke => '$setup\n$punchline';

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      setup: json['setup'] ?? 'No setup provided',
      punchline: json['punchline'] ?? 'No punchline provided',
    );
  }
}

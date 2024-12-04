import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  static Future<Map<String, dynamic>> fetchRandomJoke() async {
    final url = Uri.parse('https://api.example.com/joke');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return {'joke': 'Failed to fetch joke'};
    }
  }
}

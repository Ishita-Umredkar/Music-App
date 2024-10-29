import 'package:http/http.dart' as http;
import 'dart:convert';

class SpotifyService {
  final String clientId = 'CLIENT_ID';
  final String clientSecret = 'CLIENT_SECRET';

  Future<String> getAccessToken() async {
    final response = await http.post(
      Uri.parse('https://accounts.spotify.com/api/token'),
      headers: {
        'Authorization': 'Basic ' + base64Encode(utf8.encode('$clientId:$clientSecret')),
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'grant_type': 'client_credentials',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['access_token'];
    } else {
      throw Exception('Failed to obtain token');
    }
  }

  Future<List<dynamic>> searchTracks(String query, String accessToken) async {
    final response = await http.get(
      Uri.parse('https://api.spotify.com/v1/search?q=$query&type=track'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['tracks']['items'];
    } else {
      throw Exception('Failed to search tracks');
    }
  }
}


  

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'breed.dart';

class ApiService {
  static const String apiUrl = 'https://api.thedogapi.com/v1/breeds';

  Future<List<Breed>> fetchBreeds() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Breed> breeds =
          body.map((dynamic item) => Breed.fromJson(item)).toList();
      return breeds.take(10).toList(); // Take only the first 10 breeds
    } else {
      throw Exception('Failed to load breeds');
    }
  }
}

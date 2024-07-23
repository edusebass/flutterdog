import 'dart:convert';
import 'package:http/http.dart' as http;
import 'breed.dart';

class ApiService {
  Future<List<Breed>> fetchBreeds() async {
    final response =
        await http.get(Uri.parse('https://api.thedogapi.com/v1/breeds'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Breed.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load breeds');
    }
  }
}

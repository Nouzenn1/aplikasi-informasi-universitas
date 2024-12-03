import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/university.dart';

class ApiService {
  static const String apiUrl = 'http://universities.hipolabs.com/search';

  static Future<List<University>> fetchUniversities(String country) async {
    final response = await http.get(Uri.parse('$apiUrl?country=$country'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<University> universities = data.map((json) => University.fromJson(json)).toList();
      return universities.take(15).toList(); // Batasi hanya 15 universitas
    } else {
      throw Exception('Failed to load universities');
    }
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/recycler_view_model.dart';

class ApiServiceClass {
  Future<List<ModelClass>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<ModelClass> users = (data['data'] as List).map((user) => ModelClass.fromJson(user)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
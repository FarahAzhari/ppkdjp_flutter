import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ppkdjp_flutter/meet_22/models/user_model.dart';

Future<List<Users>> getUsers() async {
  final response = await http.get(
    Uri.parse("https://reqres.in/api/users?page=2"),
  );
  if (response.statusCode == 200) {
    final List<dynamic> userJson = json.decode(response.body)['data'];
    return userJson.map((json) => Users.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ppkdjp_flutter/harry_potter/models/character_model.dart';

Future<List<CharacterModel>> getCharacters() async {
  final response = await http.get(
    Uri.parse("https://hp-api.onrender.com/api/characters"),
  );
  if (response.statusCode == 200) {
    final List<dynamic> charJson = json.decode(response.body);
    return charJson.map((json) => CharacterModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SiswaModel {
  final int? id;
  final String name;
  final int age;
  SiswaModel({this.id, required this.name, required this.age});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'age': age};
  }

  factory SiswaModel.fromMap(Map<String, dynamic> map) {
    return SiswaModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SiswaModel.fromJson(String source) =>
      SiswaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

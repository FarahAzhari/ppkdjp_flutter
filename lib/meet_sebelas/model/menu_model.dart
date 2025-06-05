import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MenuModel {
  int? id;
  String name;
  String? description;
  double price;
  String? category;
  String? imageUrl;
  bool isAvailable;
  MenuModel({
    this.id,
    required this.name,
    this.description,
    required this.price,
    this.category,
    this.imageUrl,
    required this.isAvailable,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'category': category,
      'image_url': imageUrl,
      'is_available': isAvailable ? 1 : 0,
    };
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      price: map['price'] as double,
      category: map['category'] != null ? map['category'] as String : null,
      imageUrl: map['image_url'] != null ? map['image_url'] as String : null,
      isAvailable: map['is_available'] == 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) =>
      MenuModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

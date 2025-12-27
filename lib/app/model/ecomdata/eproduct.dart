// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Eproduct {
  final String id;
  final String name;
  final String location;
  final String description;
  double price;
  final String imageUrl;
  int stock;
  Eproduct({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.stock,
  });

  Eproduct copyWith({
    String? id,
    String? name,
    String? location,
    String? description,
    double? price,
    String? imageUrl,
    int? stock,
  }) {
    return Eproduct(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      stock: stock ?? this.stock,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'location': location,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'stock': stock,
    };
  }

  factory Eproduct.fromMap(Map<String, dynamic> map) {
    return Eproduct(
      id: map['id'] as String,
      name: map['name'] as String,
      location: map['location'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      imageUrl: map['imageUrl'] as String,
      stock: map['stock'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Eproduct.fromJson(String source) =>
      Eproduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Eproduct(id: $id, name: $name, location: $location, description: $description, price: $price, imageUrl: $imageUrl, stock: $stock)';
  }

  @override
  bool operator ==(covariant Eproduct other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.location == location &&
      other.description == description &&
      other.price == price &&
      other.imageUrl == imageUrl &&
      other.stock == stock;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      location.hashCode ^
      description.hashCode ^
      price.hashCode ^
      imageUrl.hashCode ^
      stock.hashCode;
  }
}

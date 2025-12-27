// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_ecommerce/app/model/productdata/product.dart';

class ListItem {
  final Product product;
  int quantity;
  ListItem({required this.product, required this.quantity});
  double get totalprice => product.price * quantity;

  ListItem copyWith({Product? product, int? quantity}) {
    return ListItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'product': product.toMap(), 'quantity': quantity};
  }

  factory ListItem.fromMap(Map<String, dynamic> map) {
    return ListItem(
      product: Product.fromMap(map['product'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListItem.fromJson(String source) =>
      ListItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ListItem(product: $product, quantity: $quantity)';

  @override
  bool operator ==(covariant ListItem other) {
    if (identical(this, other)) return true;

    return other.product == product && other.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;
}

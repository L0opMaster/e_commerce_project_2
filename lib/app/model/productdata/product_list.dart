// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_ecommerce/app/model/productdata/product.dart';

class ProductList {
  final List<Product> products;
  ProductList({required this.products});

  ProductList copyWith({List<Product>? products}) {
    return ProductList(products: products ?? this.products);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductList.fromMap(Map<String, dynamic> map) {
    return ProductList(
      products: List<Product>.from(
        (map['products'] as List<int>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductList.fromJson(String source) =>
      ProductList.fromMap(json.decode(source) as Map<String, dynamic>);

  factory ProductList.fromListJson(String source) {
    try {
      final List<dynamic> jsonList = jsonDecode(source) as List<dynamic>;
      return ProductList(
        products: jsonList.map((json) => Product.fromMap(json)).toList(),
      );
    } catch (e) {
      throw FormatException('Invalid Json format: $e');
    }
  }
  @override
  String toString() => 'ProductList(products: $products)';

  @override
  bool operator ==(covariant ProductList other) {
    if (identical(this, other)) return true;

    return listEquals(other.products, products);
  }

  @override
  int get hashCode => products.hashCode;
}

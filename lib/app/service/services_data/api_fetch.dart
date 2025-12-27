import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/app/model/productdata/product.dart';
import 'package:flutter_ecommerce/app/model/productdata/product_list.dart';
import 'package:http/http.dart' as http;

class ApiFetch {
  ApiFetch._internal();
  static final ApiFetch _instance = ApiFetch._internal();
  factory ApiFetch() => _instance;

  static final String _baseUrl = 'https://373415dda59b.ngrok-free.app';

  Future<List<Product>> getProduct() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final ProductList data = ProductList.fromListJson(response.body);
        return data.products;
      } else {
        throw Exception('Invalid to loading format: ${response.statusCode}');
      }
    } catch (e) {
      Center(child: throw Exception('Failed to loading product: $e'));
    }
  }
}

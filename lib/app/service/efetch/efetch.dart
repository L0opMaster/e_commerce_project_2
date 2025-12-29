import 'dart:convert';
import 'dart:io';

import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/eproduct_list.dart';
import 'package:http/http.dart' as http;

class Efetch {
  Efetch._internal();
  static final Efetch _instance = Efetch._internal();
  factory Efetch() => _instance;

  static final String _baseUrl = 'https://10d1a0b06d3e.ngrok-free.app';
  final List<String> _paths = [
    '/camera',
    '/phone',
    '/computer',
    '/watch',
    '/popular',
    '/mostpopular',
    '/recents',
  ];

  Future<EproductList> fetchingProduct() async {
    try {
      List<List<Eproduct>> allProducts = [];

      for (String path in _paths) {
        final response = await http.get(Uri.parse('$_baseUrl$path'));
        if (response.statusCode != 200) {
          throw HttpException('Fail loading $path : ${response.statusCode}');
        }
        final List<dynamic> jsonData = json.decode(response.body);
        final eproducts = jsonData.map((x) => Eproduct.fromMap(x)).toList();
        allProducts.add(eproducts);
      }
      return EproductList(
        camera: allProducts[0],
        phone: allProducts[1],
        computer: allProducts[2],
        watch: allProducts[3],
        popular: allProducts[4],
        mostpopular: allProducts[5],
        recents: allProducts[6],
      );
    } catch (e) {
      throw Exception('Error fetch: $e');
    }
  }
}

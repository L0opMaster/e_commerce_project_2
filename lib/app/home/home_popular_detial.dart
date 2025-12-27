// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/common_widgets/w_detial_product.dart';

import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';

class HomePopularDetial extends StatefulWidget {
  final Eproduct productPopular;
  const HomePopularDetial({super.key, required this.productPopular});

  @override
  State<HomePopularDetial> createState() => _HomePopularDetialState();
}

class _HomePopularDetialState extends State<HomePopularDetial> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final productPopular = widget.productPopular;
    return Scaffold(
      
      appBar: AppBar(
        title: Text(
          productPopular.name,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: colorScheme.surface),
        ),
      ),
      body: SingleChildScrollView(
        child: WDetialProduct(
          name: productPopular.name,
          price: productPopular.price,
          description: productPopular.description,
          imageUrl: productPopular.imageUrl,
        ),
      ),
    );
  }
}

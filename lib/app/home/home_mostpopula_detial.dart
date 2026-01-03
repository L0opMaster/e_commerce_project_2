// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/common_widgets/icon_cart_value.dart';
import 'package:flutter_ecommerce/app/common_widgets/w_detial_product.dart';

import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';

class HomeMostpopulaDetial extends StatefulWidget {
  final Eproduct mostPopuProduct;
  const HomeMostpopulaDetial({super.key, required this.mostPopuProduct});

  @override
  State<HomeMostpopulaDetial> createState() => _HomeMostpopulaDetialState();
}

class _HomeMostpopulaDetialState extends State<HomeMostpopulaDetial> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final mostPopuProduct = widget.mostPopuProduct;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mostPopuProduct.name,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: colorScheme.surface),
        ),
        actions: [Iconcartvalue()],
      ),
      body: SingleChildScrollView(
        child: WDetialProduct(
          stock: mostPopuProduct.stock,
          productPopular: mostPopuProduct,
          id: mostPopuProduct.id,
          name: mostPopuProduct.name,
          price: mostPopuProduct.price,
          description: mostPopuProduct.description,
          imageUrl: mostPopuProduct.imageUrl,
        ),
      ),
    );
  }
}

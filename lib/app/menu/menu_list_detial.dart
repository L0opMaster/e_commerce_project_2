// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/common_widgets/iconCartValue.dart';
import 'package:flutter_ecommerce/app/common_widgets/w_detial_product.dart';

import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';

class MenuListDetial extends StatefulWidget {
  final Eproduct detialProduct;
  const MenuListDetial({super.key, required this.detialProduct});

  @override
  State<MenuListDetial> createState() => _MenuListDetialState();
}

class _MenuListDetialState extends State<MenuListDetial> {
  @override
  Widget build(BuildContext context) {
    final detialProduct = widget.detialProduct;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          detialProduct.name,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: colorScheme.surface),
        ),
        actions: [Iconcartvalue()],
      ),
      body: SingleChildScrollView(
        child: WDetialProduct(
          stock: detialProduct.stock,
          id: detialProduct.id,
          productPopular: detialProduct,
          name: detialProduct.name,
          price: detialProduct.price,
          description: detialProduct.description,
          imageUrl: detialProduct.imageUrl,
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ecommerce/app/cart/cart_screen.dart';
import 'package:flutter_ecommerce/app/common_widgets/search_button.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';
import 'package:flutter_ecommerce/app/offer/card_product.dart';

class OfferView extends StatefulWidget {
  final List<Eproduct> allproductOffer;
  const OfferView({super.key, required this.allproductOffer});

  @override
  State<OfferView> createState() => _HomeViewState();
}

class _HomeViewState extends State<OfferView> {
  @override
  Widget build(BuildContext context) {
    final product = widget.allproductOffer.take(10).toList();
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Offer',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: colorScheme.surface),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 20),
            child: IconButton(
              onPressed: () {
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                };
              },
              icon: Icon(
                Icons.shopping_cart,
                color: colorScheme.surface,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SearchButton(),
          Expanded(
            child: GridView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
                crossAxisSpacing: 5,
              ),
              itemCount: product.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [CardProduct(allproduct: product[index])],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

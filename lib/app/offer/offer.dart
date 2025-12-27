import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/common_widgets/search_button.dart';
import 'package:flutter_ecommerce/app/model/productdata/product.dart';
import 'package:flutter_ecommerce/app/service/services_data/api_fetch.dart';
import 'package:flutter_ecommerce/app/service/services_data/cart_services.dart';
import 'package:flutter_ecommerce/app/cart/cart_screen.dart';
import 'package:flutter_ecommerce/app/offer/card_product.dart';

class OfferView extends StatefulWidget {
  const OfferView({super.key});

  @override
  State<OfferView> createState() => _HomeViewState();
}

class _HomeViewState extends State<OfferView> {
  final ApiFetch _apiFetch = ApiFetch();
  late Future<List<Product>> _future;
  final CartServices cartservices = CartServices();

  @override
  void initState() {
    super.initState();
    loadingProduct();
  }

  void loadingProduct() {
    setState(() {
      _future = _apiFetch.getProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Offer',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: colorScheme.tertiary),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 20),
            child: ValueListenableBuilder(
              valueListenable: cartservices.cartNotifier,
              builder: (context, value, child) {
                final totalItem = cartservices.cartNotifier.value.length;
                return IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartScreen()),
                    );
                  },
                  icon: totalItem > 0
                      ? Stack(
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              size: 30,
                              color: colorScheme.primary,
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                // width: 40,
                                // height: 40,
                                padding: EdgeInsets.only(left: 2, right: 2),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                constraints: BoxConstraints(
                                  minHeight: 16,
                                  minWidth: 16,
                                ),
                                child: Text(
                                  '$totalItem',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Icon(
                          Icons.shopping_cart,
                          color: colorScheme.tertiary,
                          size: 30,
                        ),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SearchButton(),
          Expanded(
            child: FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No product found'));
                }
                final products = snapshot.data!;
                return GridView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 5,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [CardProduct(product: products[index])],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

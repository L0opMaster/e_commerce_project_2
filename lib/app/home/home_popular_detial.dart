// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/common_widgets/w_detial_product.dart';

import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';
import 'package:flutter_ecommerce/app/service/efetch/e_cartservice.dart';

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
    final ECartservice cartservice = ECartservice();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          productPopular.name,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: colorScheme.surface),
        ),
        actions: [
          ValueListenableBuilder(
            valueListenable: cartservice.cartNotifi,
            builder: (context, value, child) {
              // final totalItem = value.fold<int>(
              //   0,
              //   (sum, item) => sum + item.quantity,
              // );
              final totalIem = value.length;
              return Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: IconButton(
                  onPressed: () {},
                  icon: totalIem > 0
                      ? Stack(
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              size: 30,
                              color: colorScheme.surface,
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
                                  '${totalIem}',
                                  style: TextStyle(
                                    color: Colors.black,
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
                          size: 30,
                          color: colorScheme.surface,
                        ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: WDetialProduct(
          productPopular: productPopular,
          name: productPopular.name,
          price: productPopular.price,
          description: productPopular.description,
          imageUrl: productPopular.imageUrl,
        ),
      ),
    );
  }
}

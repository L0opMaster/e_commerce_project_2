import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/cart/comfirm_checkout.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/list_eitem.dart';
import 'package:flutter_ecommerce/app/service/efetch/e_cartservice.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final ECartservice cartservice = ECartservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: Text(
          'Shopping cart',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Expanded(
              child: ValueListenableBuilder<List<ListEitem>>(
                valueListenable: cartservice.cartNotifi,
                builder: (context, cartItem, child) {
                  return ListView.builder(
                    itemCount: cartItem.length,
                    itemBuilder: (context, index) {
                      final product = cartItem[index].eproduct;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 5.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFEF5),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                // ignore: deprecated_member_use
                                color: const Color.fromARGB(
                                  41,
                                  136,
                                  136,
                                  136,
                                ).withValues(),
                                offset: const Offset(0, 0),
                                blurRadius: 1,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10,
                                ),
                                child: Image.asset(
                                  product.imageUrl,
                                  errorBuilder: (context, error, stackTrace) {
                                    return SizedBox(
                                      width: 100,
                                      height: 70,
                                      child: Icon(
                                        Icons.error,
                                        size: 30,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.error,
                                      ),
                                    );
                                  },
                                  width: 100,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      '\$ ${product.price}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                            color: Colors.orange,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  cartservice.updateQuantity(
                                    product.id,
                                    cartItem[index].quantity - 1,
                                  );
                                },
                                icon: Icon(
                                  Icons.remove_circle_outline,
                                  size: 25,
                                ),
                              ),
                              Text('${cartItem[index].quantity}'),
                              IconButton(
                                onPressed: () {
                                  cartservice.updateQuantity(
                                    product.id,
                                    cartItem[index].quantity + 1,
                                  );
                                },
                                icon: Icon(
                                  Icons.add_circle_outline_outlined,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFEF5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: const Color(0xFF353534).withOpacity(0.25),
                    offset: const Offset(0, 0),
                    blurRadius: 1,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Price',
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(fontSize: 18),
                        ),
                        ValueListenableBuilder<List<ListEitem>>(
                          valueListenable: cartservice.cartNotifi,
                          builder: (context, __, _) {
                            return Text(
                              '\$ ${cartservice.totalCost.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.labelMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    fontSize: 18,
                                  ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10,
                    ),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(20),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => ComfirmCheckout(),
                        );
                      },
                      icon: Icon(Icons.library_add_check_sharp),
                      label: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'Check Out',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
      // backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}

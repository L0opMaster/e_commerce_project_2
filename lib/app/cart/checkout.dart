import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/home/home_view.dart';
import 'package:flutter_ecommerce/app/main_tapview/main_tapbar.dart';
import 'package:flutter_ecommerce/app/service/efetch/e_cartservice.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckhoutState();
}

class _CheckhoutState extends State<Checkout> {
  final ECartservice cartservice = ECartservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Checkout Successfully'),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          children: [
            _buildThankYouSection(),
            _buildSumarySection(),
            _backToHomeScreen(context),
          ],
        ),
      ),
    );
  }

  Widget _backToHomeScreen(context) {
    return ElevatedButton(
      onPressed: () {
        // _cartService.clearCart(); // Clear the cart after checkout
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainTapbar()),
          (Route<dynamic> route) => false,
        );
      },
      child: const Padding(
        padding: EdgeInsets.all(18.0),
        child: Text('Back to Store', style: TextStyle(fontSize: 18)),
      ),
    );
  }

  Widget _buildSumarySection() {
    final listitem = cartservice.cartNotifi.value;
    double totalPrice = 0;
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 40),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.34),
              offset: const Offset(0, 0),
              blurRadius: 13,
              spreadRadius: -1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Order Summary',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1, height: 2, color: Colors.grey),
              const SizedBox(height: 15),
              // List all cart products dynamically
              ...listitem.map((p) {
                final quantity = p.quantity;
                final price = p.eproduct.price;
                final itemtotalprice = quantity * price;
                totalPrice += itemtotalprice;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${p.eproduct.name} (x$quantity)',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('\$${totalPrice.toStringAsFixed(2)}'),
                      ),
                    ],
                  ),
                );
              }).toList(),

              const SizedBox(height: 10),
              const Divider(thickness: 1, height: 2, color: Colors.grey),
              const SizedBox(height: 15),

              // Total price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThankYouSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(
          Icons.check_circle_outline_outlined,
          color: Colors.green,
          size: 100,
        ),
        SizedBox(height: 20),
        Text(
          'Thank You for Your Order!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          'Your purchase has been confirmed. A summary of your order is below.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17, color: Colors.grey),
        ),
      ],
    );
  }
}

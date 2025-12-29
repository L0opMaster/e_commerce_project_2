import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/cart/cart_screen.dart';
import 'package:flutter_ecommerce/app/service/efetch/e_cartservice.dart';

class Iconcartvalue extends StatefulWidget {
  const Iconcartvalue({super.key});

  @override
  State<Iconcartvalue> createState() => _IconcartvalueState();
}

class _IconcartvalueState extends State<Iconcartvalue> {
  final ECartservice cartservice = ECartservice();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ValueListenableBuilder<int>(
      valueListenable: cartservice.cartBadge,
      builder: (context, badgeCount, child) {
        return Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: IconButton(
            onPressed: () {
              cartservice.clearBadge();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            icon: badgeCount > 0
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
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          constraints: BoxConstraints(
                            minHeight: 16,
                            minWidth: 16,
                          ),
                          child: Text(
                            '$badgeCount',
                            style: TextStyle(color: Colors.black, fontSize: 10),
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
    );
  }
}

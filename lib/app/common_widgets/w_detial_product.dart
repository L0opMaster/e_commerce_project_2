// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';
import 'package:flutter_ecommerce/app/service/efetch/e_cartservice.dart';

class WDetialProduct extends StatefulWidget {
  final Eproduct productPopular;
  final String imageUrl;
  final String name;
  final double price;
  final String description;
  const WDetialProduct({
    Key? key,
    required this.productPopular,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  State<WDetialProduct> createState() => _WDetialProductState();
}

class _WDetialProductState extends State<WDetialProduct> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    var media = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentGeometry.topCenter,
      children: [
        Image.asset(
          widget.imageUrl,
          width: media.width * 1,
          height: 200,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          margin: EdgeInsets.only(top: 190),
          width: double.infinity,
          height: media.height * 1,
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Color(0xFF616060).withOpacity(0.84),
                offset: Offset(0, -1),
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Model',
                style: TextStyle(fontSize: 10, color: Colors.black87),
              ),
              SizedBox(height: 5),
              Text(
                widget.name,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Star',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: colorScheme.primary,
                      fontSize: 20,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'USS:  ',
                              style: Theme.of(
                                context,
                              ).textTheme.labelLarge?.copyWith(fontSize: 20),
                            ),

                            TextSpan(
                              text: '${widget.price}',
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    color: colorScheme.primary,
                                    fontSize: 25,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '/ per Item',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: colorScheme.secondary,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                'Description: ',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.description,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 12,
                  color: colorScheme.secondary,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Number of portions',
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_circle_outline,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text('2', style: TextStyle(color: colorScheme.primary)),
                      SizedBox(width: 20),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle_outline,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Stack(
                alignment: AlignmentGeometry.topLeft,
                children: [
                  Container(
                    width: 150,
                    height: 170,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80),
                        bottomRight: Radius.circular(80),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 100, top: 25),
                    width: 230,
                    height: 120,
                    decoration: BoxDecoration(
                      // color: Colors.amber,
                      color: colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Color(0xFF9C9C9C).withOpacity(0.84),
                          offset: Offset(0, -1),
                          blurRadius: 6,
                          spreadRadius: 1,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            'Total Price',
                            style: TextStyle(
                              fontSize: 15,
                              color: colorScheme.secondary,
                            ),
                          ),
                          Text(
                            '\$',
                            style: TextStyle(
                              fontSize: 25,
                              color: colorScheme.secondary,
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              final ECartservice eCartservice = ECartservice();
                              eCartservice.addProduct(widget.productPopular);
                              print(eCartservice.cartNotifi.value);
                            },
                            label: Text('Add to cart'),
                            icon: Icon(Icons.shopping_cart, size: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.only(left: 320, top: 65),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Color(0xFF616060).withOpacity(0.84),
                          offset: Offset(0, -1),
                          blurRadius: 6,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        color: colorScheme.primary,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

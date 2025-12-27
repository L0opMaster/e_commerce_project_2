// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ecommerce/app/model/productdata/product.dart';
import 'package:flutter_ecommerce/app/service/services_data/cart_services.dart';
import 'package:flutter_ecommerce/app/offer/detail_imfrom.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  const CardProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailImfrom(product: product),
          ),
        );
      },
      child: Card(
        borderOnForeground: false,
        clipBehavior: Clip.antiAlias,
        elevation: 1,
        child: SizedBox(
          width: media.width * 0.45,
          height: media.height * 0.26,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.network(
                  product.imageUrl,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error, color: Colors.red, size: 40);
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge?.copyWith(fontSize: 15),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$ ${product.price}',
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall?.copyWith(fontSize: 13),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  bottom: 5.0,
                  left: 10.0,
                  right: 10.0,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: product.stock > 0
                        ? () {
                            final cartServices = CartServices();
                            cartServices.addProduct(product);
                            // print(cartServices.cartNotifier.value);
                          }
                        : null,
                    label: Text(
                      'Add to cart',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

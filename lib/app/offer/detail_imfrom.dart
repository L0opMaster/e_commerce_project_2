// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/common_widgets/iconCartValue.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';
import 'package:flutter_ecommerce/app/service/efetch/e_cartservice.dart';

class DetailImfrom extends StatefulWidget {
  // final Product product;
  final Eproduct product;
  const DetailImfrom({super.key, required this.product});

  @override
  State<DetailImfrom> createState() => _DetailImfromState();
}

class _DetailImfromState extends State<DetailImfrom> {
  int upQuantity = 1;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        actions: [Iconcartvalue()],
        // backgroundColor: Theme.of(context).colorScheme.surface,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.surface),
        title: Text(
          widget.product.name,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
          elevation: 3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ---- Image ----
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  widget.product.imageUrl,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: Center(
                          child: Icon(Icons.event_repeat_rounded, size: 40),
                        ),
                      ),
                    );
                  },
                  // loadingBuilder: (context, child, loadingProgress) {
                  //   if (loadingProgress == null) return child;
                  //   return Center(
                  //     child: CircularProgressIndicator(
                  //       value: loadingProgress.expectedTotalBytes != null
                  //           ? loadingProgress.cumulativeBytesLoaded /
                  //                 loadingProgress.expectedTotalBytes!
                  //           : null,
                  //     ),
                  //   );
                  // },
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),

              // ---- Spacing & Details ----
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    Text(
                      widget.product.name,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      '\$${widget.product.price}',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      'Available to add: ${widget.product.stock} (Total Stock: ${widget.product.stock})',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Divider(thickness: 2),
                    const SizedBox(height: 15),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.product.description,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (upQuantity > 1) {
                              setState(() {
                                upQuantity--;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.remove_circle_outline,
                            size: 30,
                            color: colorScheme.primary,
                          ),
                        ),
                        Text('${upQuantity}'),
                        IconButton(
                          onPressed: () {
                            if (upQuantity < widget.product.stock) {
                              setState(() {
                                upQuantity++;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.add_circle_outline,
                            size: 30,
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {
                  final addTocart = ECartservice();
                  addTocart.addProductWithQuantity(widget.product, upQuantity);
                },
                label: Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Text(
                    'Add to cart',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
                icon: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

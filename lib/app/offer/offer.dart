import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/common_widgets/search_anchor.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';
import 'package:flutter_ecommerce/app/offer/card_product.dart';
import 'package:flutter_ecommerce/app/offer/detail_imfrom.dart';

class OfferView extends StatefulWidget {
  final List<Eproduct> allproductOffer;
  const OfferView({super.key, required this.allproductOffer});

  @override
  State<OfferView> createState() => _OfferViewState();
}

class _OfferViewState extends State<OfferView> {
  late List<Eproduct> allProducts;
  late List<Eproduct> displayedProducts;
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    allProducts = widget.allproductOffer;
    displayedProducts = allProducts;
  }

  void _onSearchChanged(String query) {
    setState(() {
      isSearching = query.isNotEmpty;

      if (query.isEmpty) {
        displayedProducts = allProducts;
      } else {
        displayedProducts = allProducts
            .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _onProductSelected(Eproduct product) {
    setState(() {
      isSearching = true;
      displayedProducts = [product];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Offer')),
      body: Column(
        children: [
          SearchAnChor(
            product: allProducts,
            onSelected: _onProductSelected,
            onChanged: _onSearchChanged,
          ),
          Expanded(
            child: displayedProducts.isEmpty
                ? const Center(child: Text('No products found'))
                : isSearching
                ? _buildListView()
                : _buildGridView(),
          ),
        ],
      ),
    );
  }

  /// GRID VIEW (default style)
  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemCount: displayedProducts.length,
      itemBuilder: (context, index) {
        return CardProduct(allproduct: displayedProducts[index]);
      },
    );
  }

  /// LIST VIEW (search result style)
  Widget _buildListView() {
    return ListView.separated(
      itemCount: displayedProducts.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final product = displayedProducts[index];
        return ListTile(
          leading: Image.asset(
            product.imageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(product.name),
          subtitle: Text('\$${product.price}'),
          onTap: () {
            print('push');

            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(builder: (_) => DetailImfrom(product: product)),
            );
          },
        );
      },
    );
  }
}

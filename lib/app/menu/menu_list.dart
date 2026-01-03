// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/common_widgets/icon_cart_value.dart';
import 'package:flutter_ecommerce/app/common_widgets/search_anchor.dart';
import 'package:flutter_ecommerce/app/menu/menu_list_detial.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';
import 'package:flutter_ecommerce/app/offer/detail_imfrom.dart';

class MenuList extends StatefulWidget {
  final Map<String, String> title;
  final List<Eproduct> product;
  const MenuList({super.key, required this.title, required this.product});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  bool isSearch = false;
  late List<Eproduct> displayProduct;
  late List<Eproduct> category;
  @override
  void initState() {
    super.initState();
    category = widget.product;
    displayProduct = category;
  }

  // onChange Searching
  void _onSearchChange(String query) {
    setState(() {
      isSearch = query.isNotEmpty;

      if (query.isEmpty) {
        displayProduct = category;
      } else {
        displayProduct = category
            .where((c) => c.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  // onProduct Selection
  void _onProductSelected(Eproduct product) {
    setState(() {
      isSearch = true;
      displayProduct = [product];
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    var media = MediaQuery.of(context).size;
    // final title = widget.title["title"].toString;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title["title"].toString(),
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: colorScheme.surface),
        ),
        actions: [Iconcartvalue()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SearchButton(),
            SearchAnChor(
              product: widget.product,
              onSelected: _onProductSelected,
              onChanged: _onSearchChange,
            ),
            displayProduct.isEmpty
                ? SizedBox(
                    height: media.height * 0.5,
                    child: const Center(child: Text('No Product Found')),
                  )
                : isSearch
                ? _buildListView()
                : ListView.builder(
                    itemCount: widget.product.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final category = widget.product[index];
                      return InkWell(
                        onTap: () {
                          // ignore: avoid_print
                          print('Ontab');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MenuListDetial(detialProduct: category),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            vertical: 5,
                            horizontal: 8,
                          ),
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 4,
                            color: colorScheme.surface,
                            child: SizedBox(
                              height: 300,
                              width: double.infinity,
                              child: Stack(
                                alignment: AlignmentGeometry.topCenter,
                                children: [
                                  Image.asset(
                                    category.imageUrl,
                                    width: media.width * 0.9,
                                    height: 200,
                                    fit: BoxFit.contain,
                                  ),
                                  Positioned(
                                    left: 30,
                                    bottom: 30,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          category.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                color: Colors.black,
                                                fontSize: 20,
                                              ),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text(
                                              'Star',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                    color: colorScheme.primary,
                                                  ),
                                            ),
                                            SizedBox(width: 30),
                                            Text(
                                              category.location,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                    color:
                                                        colorScheme.secondary,
                                                  ),
                                            ),
                                            SizedBox(width: 30),
                                            Text(
                                              widget.title["title"].toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                    color:
                                                        colorScheme.secondary,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }

  /// LIST VIEW (search result style)
  Widget _buildListView() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: displayProduct.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final product = displayProduct[index];
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
            // ignore: avoid_print
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

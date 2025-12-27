// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ecommerce/app/common_widgets/search_button.dart';
import 'package:flutter_ecommerce/app/menu/menu_list_detial.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';

class MenuList extends StatefulWidget {
  final Map<String, String> title;
  final List<Eproduct> product;
  const MenuList({super.key, required this.title, required this.product});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart, size: 30),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchButton(),
            ListView.builder(
              itemCount: widget.product.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final category = widget.product[index];
                return InkWell(
                  onTap: () {
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                              color: colorScheme.secondary,
                                            ),
                                      ),
                                      SizedBox(width: 30),
                                      Text(
                                        widget.title["title"].toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              color: colorScheme.secondary,
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
}

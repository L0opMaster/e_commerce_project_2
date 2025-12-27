// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ecommerce/app/common_widgets/round_menu_list.dart';
import 'package:flutter_ecommerce/app/common_widgets/search_button.dart';
import 'package:flutter_ecommerce/app/menu/menu_list.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/eproduct_list.dart';

class MenuView extends StatefulWidget {
  final EproductList products;
  const MenuView({super.key, required this.products});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  List<Eproduct> _getProductsByCategory(String title) {
    switch (title) {
      case 'Camera':
        return widget.products.camera;
      case 'Computer':
        return widget.products.computer;
      case 'Phone':
        return widget.products.phone;
      case 'Watch':
        return widget.products.watch;
      default:
        return [];
    }
  }

  List<Map<String, String>> image = [
    {
      "image": "assets/image/camera_blue.jpg",
      "title": "Camera",
      "coumt": "20itme",
    },
    {"image": "assets/image/phone.jpg", "title": "Phone", "coumt": "20 itme"},
    {
      "image": "assets/image/computer2.png",
      "title": "Computer",
      "coumt": "20itme",
    },
    {"image": "assets/image/watch.jpg", "title": "Watch", "coumt": "20itme"},
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Menu',
            style: textTheme.headlineMedium?.copyWith(
              color: colorScheme.surface, // ✅ theme aware
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: colorScheme.surface, // ✅ theme aware
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchButton(), // ensure text inside is theme-aware
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                // Orange background bar
                Container(
                  width: media.width * 0.18,
                  height: media.height * 0.6,
                  decoration: BoxDecoration(
                    color: colorScheme.primary, // ✅ theme aware
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),

                // Card + Image
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: image.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RoundMenuList(
                        title: image[index]["title"].toString(),
                        iteamcount: image[index]["coumt"].toString(),
                        onTab: () {
                          final categoryTitle = image[index]["title"]
                              .toString();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenuList(
                                product: _getProductsByCategory(categoryTitle),
                                title: image[index],
                              ),
                            ),
                          );
                        },
                        imageUrl: image[index]["image"].toString(),
                        // ✅ inside RoundMenuList, make text theme-aware
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

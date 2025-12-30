// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/common_widgets/iconCartValue.dart';
import 'package:flutter_ecommerce/app/common_widgets/search_anchor.dart';
import 'package:flutter_ecommerce/app/home/home_mostpopula_detial.dart';
import 'package:flutter_ecommerce/app/home/home_popular_detial.dart';
import 'package:flutter_ecommerce/app/home/home_recent_detial.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/list_eitem.dart';
import 'package:flutter_ecommerce/app/offer/detail_imfrom.dart';
import 'package:flutter_ecommerce/app/service/efetch/e_cartservice.dart';

class HomeView extends StatefulWidget {
  final List<Eproduct> allproduct;
  const HomeView({super.key, required this.allproduct});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSearching = false;
  late List<Eproduct> allproducts;
  late List<Eproduct> displayProduct;

  @override
  void initState() {
    super.initState();
    allproducts = widget.allproduct;
    displayProduct = allproducts;
  }

  // onSearchingChange
  void onSearchChange(String query) {
    setState(() {
      isSearching = query.isNotEmpty;

      if (query.isEmpty) {
        displayProduct = allproducts;
      } else {
        displayProduct = allproducts
            .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  // onSearchSeletetion
  void onSelection(Eproduct product) {
    setState(() {
      isSearching = true;
      displayProduct = [product];
    });
  }

  List<Map<String, String>> listcart = [
    {"image": "assets/image/camera_blue.jpg", "title": "Camera"},
    {"image": "assets/image/phone.jpg", "title": "Phone"},
    {"image": "assets/image/computer2.png", "title": "Computer"},
    {"image": "assets/image/watch.jpg", "title": "Watch"},
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final cartservices = ECartservice();
    var media = MediaQuery.of(context).size;
    // Example: Popular, Most Popular, Recent
    final popular = widget.allproduct.take(4).toList();
    final mostPopular = widget.allproduct.skip(4).take(3).toList();
    final recents = widget.allproduct.skip(7).take(4).toList();
    // final mostPopular = widget.allproduct.asMap()
    // .entries
    // .where((entry) => ![1, 3, 4, 6].contains(entry.key)) // exclude these indices
    // .map((entry) => entry.value)
    // .take(5)
    // .toList();

    // final selectedProducts = [9, 7, 10]; // indices you want

    // final mostPopular = widget.allproduct.asMap()
    //     .entries
    //     .where((entry) => selectedProducts.contains(entry.key))
    //     .map((entry) => entry.value)
    //     .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'E-Commerce App',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [Iconcartvalue()],
      ),
      body: ValueListenableBuilder(
        valueListenable: cartservices.cartNotifi,
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Good morning Luffy',
                        style: TextStyle(
                          color: colorScheme.secondary,
                          fontWeight: FontWeight.w400,
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Delivery to',
                        style: TextStyle(color: const Color(0xFF424242)),
                      ),
                      Row(
                        children: [
                          Text(
                            'Current Location',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                            color: colorScheme.secondary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SearchAnChor(
                    product: widget.allproduct,
                    onSelected: onSelection,
                    onChanged: onSearchChange,
                  ),
                ),

                displayProduct.isEmpty
                    ? SizedBox(
                        height: media.height * 0.5,
                        child: const Center(child: Text('No Product found')),
                      )
                    : isSearching
                    ? _buildListView()
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: SizedBox(
                              height: 120,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: listcart.length,
                                itemBuilder: (context, index) {
                                  var image =
                                      listcart[index] as Map<String, dynamic>;
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 40.0),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Column(
                                        children: [
                                          ClipOval(
                                            child: Container(
                                              width: 80,
                                              height: 80,
                                              color: Colors.redAccent,
                                              child: Image.asset(
                                                image["image"].toString(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            image["title"].toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Popular Products',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'View all',
                                  style: TextStyle(color: colorScheme.primary),
                                ),
                              ],
                            ),
                          ),
                          ValueListenableBuilder<List<ListEitem>>(
                            valueListenable: cartservices.cartNotifi,
                            builder: (context, item, child) {
                              return _popularProduct(
                                popular,
                                media,
                                colorScheme,
                              );
                            },
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Most Popular',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'View all',
                                  style: TextStyle(
                                    color: colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsetsGeometry.only(left: 20),
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              height: 160,
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                color: colorScheme.surface,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                                border: Border(
                                  left: BorderSide(
                                    color: colorScheme.primary,
                                    width: 1.5,
                                  ),
                                  top: BorderSide(
                                    color: colorScheme.primary,
                                    width: 1.5,
                                  ),
                                  bottom: BorderSide(
                                    color: colorScheme.primary,
                                    width: 1.5,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    // ignore: deprecated_member_use
                                    color: Color(0xFF000000).withOpacity(0.23),
                                    offset: Offset(8, 0),
                                    blurRadius: 19,
                                    spreadRadius: -4,
                                  ),
                                ],
                              ),
                              child: _mostPopular(mostPopular, colorScheme),
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recent Items',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'View all',
                                  style: TextStyle(
                                    color: colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsetsGeometry.only(left: 20),
                            child: _recentItems(recents, colorScheme),
                          ),
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    );
  }

  ListView _recentItems(List<Eproduct> recents, ColorScheme colorScheme) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: recents.length,
      itemBuilder: (context, index) {
        final re = recents[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecentItem(recentItem: re),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Color(0xFF000000).withOpacity(0.23),
                          offset: Offset(8, 0),
                          blurRadius: 19,
                          spreadRadius: -4,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      re.imageUrl,
                      width: 140,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        re.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        re.location,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        'Start',
                        style: TextStyle(color: colorScheme.secondary),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  ListView _mostPopular(List<Eproduct> mostPopular, ColorScheme colorScheme) {
    return ListView.builder(
      itemCount: mostPopular.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final mop = mostPopular[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HomeMostpopulaDetial(mostPopuProduct: mop),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  color: colorScheme.surface,
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        mop.imageUrl,
                        width: 170,
                        height: 97,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 6,
                          left: 10.0,
                          bottom: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mop.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  mop.location,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  'Star',
                                  style: TextStyle(
                                    color: colorScheme.primary,
                                    fontSize: 10,
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
              ],
            ),
          ),
        );
      },
    );
  }

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
            print('push');

            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(builder: (_) => DetailImfrom(product: product)),
            );
          },
        );
      },
    );
  }

  ListView _popularProduct(
    List<Eproduct> popular,
    Size media,
    ColorScheme colorScheme,
  ) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: popular.length,
      itemBuilder: (context, index) {
        final popuLar = popular[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HomePopularDetial(productPopular: popuLar),
              ),
            );
          },
          child: SizedBox(
            width: media.width * 0.7,
            height: media.height * 0.34,
            child: Card(
              elevation: 1,
              clipBehavior: Clip.antiAlias,
              color: colorScheme.surface,
              // decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10,
                    ),
                    child: Center(
                      child: Image.asset(
                        popuLar.imageUrl,
                        // width: double.infinity,
                        width: media.width * 0.7,
                        height: media.height * 0.21,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          popuLar.name,
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Start',
                              style: TextStyle(color: colorScheme.primary),
                            ),
                            SizedBox(width: 20),
                            Text(
                              popuLar.location,
                              style: TextStyle(color: colorScheme.secondary),
                            ),
                            SizedBox(width: 20),
                            Text(
                              '\$${popuLar.price}',
                              style: TextStyle(
                                color: colorScheme.secondary,
                                fontSize: 15,
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
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/common_widgets/round_menu_button.dart';
import 'package:flutter_ecommerce/app/home/home_view.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/eproduct_list.dart';
import 'package:flutter_ecommerce/app/more/more.dart';
import 'package:flutter_ecommerce/app/offer/offer.dart';
import 'package:flutter_ecommerce/app/menu/menu_view.dart';
import 'package:flutter_ecommerce/app/profile/profile_screen.dart';
import 'package:flutter_ecommerce/app/service/efetch/efetch.dart';

class MainTapbar extends StatefulWidget {
  const MainTapbar({super.key});

  @override
  State<MainTapbar> createState() => _MainTapbarState();
}

class _MainTapbarState extends State<MainTapbar> {
  final Efetch _efetch = Efetch();
  late Future<EproductList> _future;
  List<Eproduct> allProduct = [];
  List<Eproduct> allProductaction = [];

  int selectPage = 0;
  Widget isSlectpage = const Center(child: CircularProgressIndicator());

  final PageStorageBucket storageBucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() {
    _future = _efetch.fetchingProduct();
  }

  void _onTabSelected(int page, {Widget? pageWidget}) {
    if (selectPage != page) {
      selectPage = page;
      if (pageWidget != null) {
        isSlectpage = pageWidget;
      }
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FutureBuilder<EproductList>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (!snapshot.hasData) {
          return const Scaffold(body: Center(child: Text('No products found')));
        }

        // Save all products into state variable
        final products = snapshot.data!;
        allProduct = [
          ...products.camera,
          ...products.computer,
          ...products.phone,
          ...products.watch,
        ];
        allProductaction = [
          ...products.camera,
          ...products.computer,
          ...products.phone,
          ...products.watch,
          ...products.mostpopular,
          ...products.recents,
          ...products.popular,
        ];

        // Initialize HomeView only once after data loaded
        if (selectPage == 0 && isSlectpage is! HomeView) {
          isSlectpage = HomeView(allproduct: allProduct);
        }

        return Scaffold(
          body: PageStorage(bucket: storageBucket, child: isSlectpage),

          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: SizedBox(
            height: 60,
            width: 60,
            child: FloatingActionButton(
              onPressed: () => _onTabSelected(
                0,
                pageWidget: HomeView(allproduct: allProduct),
              ),
              shape: const CircleBorder(),
              highlightElevation: 0,
              elevation: 2,
              backgroundColor: selectPage == 0
                  ? colorScheme.primary
                  : colorScheme.surface,
              child: Image.asset(
                'assets/image/tab_home.png',
                width: 30,
                height: 30,
                color: selectPage == 0
                    ? colorScheme.surface
                    : colorScheme.primary,
              ),
            ),
          ),

          bottomNavigationBar: BottomAppBar(
            height: 80,
            elevation: 2,
            notchMargin: 5,
            padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
            shape: const CircularNotchedRectangle(),
            color: colorScheme.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundManuTabButton(
                  title: 'Menu',
                  icon: 'assets/image/tab_menu.png',
                  isSelected: selectPage == 1,
                  onTab: () => _onTabSelected(
                    1,
                    pageWidget: MenuView(
                      products: products,
                      allProduct: allProduct,
                    ),
                  ),
                ),
                RoundManuTabButton(
                  title: 'Offer',
                  icon: 'assets/image/tab_offer.png',
                  isSelected: selectPage == 2,
                  onTab: () => _onTabSelected(
                    2,
                    pageWidget: OfferView(allproductOffer: allProduct),
                  ),
                ),
                const SizedBox(width: 20),
                RoundManuTabButton(
                  title: 'More',
                  icon: 'assets/image/tab_more.png',
                  isSelected: selectPage == 3,
                  onTab: () => _onTabSelected(3, pageWidget: MoreScreen()),
                ),
                RoundManuTabButton(
                  title: 'Profile',
                  icon: 'assets/image/tab_profile.png',
                  isSelected: selectPage == 4,
                  onTab: () => _onTabSelected(4, pageWidget: ProfileScreen()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

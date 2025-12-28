// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ecommerce/app/common_widgets/w_detial_product.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';

class RecentItem extends StatefulWidget {
  final Eproduct recentItem;
  const RecentItem({
    super.key,
    required this.recentItem,
  });

  @override
  State<RecentItem> createState() => _RecentItemState();
}

class _RecentItemState extends State<RecentItem> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final recentItem = widget.recentItem;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          recentItem.name,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: colorScheme.tertiary),
        ),
      ),
      body: SingleChildScrollView(
        child: WDetialProduct(
          productPopular: recentItem,
          name: recentItem.name,
          price: recentItem.price,
          description: recentItem.description,
          imageUrl: recentItem.imageUrl,
        ),
      ),
    );
  }
}

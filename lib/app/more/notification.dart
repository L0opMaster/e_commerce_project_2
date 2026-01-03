// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/common_widgets/icon_cart_value.dart';

import 'package:flutter_ecommerce/app/model/ecomdata/list_eitem.dart';

import 'package:flutter_ecommerce/app/service/efetch/e_cartservice.dart';

class NotificationScreen extends StatefulWidget {
  final Map<String, String> title;
  const NotificationScreen({super.key, required this.title});

  @override
  State<NotificationScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<NotificationScreen> {
  final ECartservice cartservice = ECartservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title["title"].toString()),
        actions: [Iconcartvalue()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            ValueListenableBuilder<List<ListEitem>>(
              valueListenable: cartservice.cartNotifi,
              builder: (context, item, child) {
                return ListView.builder(
                  itemCount: item.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final items = item[index].eproduct;
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 0.5, color: Colors.black38),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(10),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.dark_mode_outlined,
                                size: 20,
                                color: Colors.orange,
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'You has added ${items.name} to your cart',
                                        textAlign: TextAlign.start,
                                        softWrap: true,
                                        maxLines: 5,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Now',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  final Map<String, String> title;
  const Order({super.key, required this.title});

  @override
  State<Order> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title["title"].toString()),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(Icons.arrow_back_ios),
        // ),
      ),
    );
  }
}

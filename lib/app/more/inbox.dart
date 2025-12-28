// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  final Map<String, String> title;
  const InboxScreen({super.key, required this.title});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title["title"].toString()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
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
            SizedBox(height: 20),
            ListView.builder(
              itemCount: 15,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black26),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.local_post_office_outlined,
                                  size: 20,
                                ),
                                Text(
                                  ' MealMonkey Promotions',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),

                            Text('6th, July'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: SizedBox(
                                  width: 250,

                                  child: Text(
                                    'Track sleep quality and wrist temperature detection in the Vitals app, offering 18-hour battery life and fast charging. Includes support for various workouts, cellular capabilities for calls and texts at 5G speeds, and safety features like Emergency SOS, Fall Detection, and Crash Detection.',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 50),
                            Icon(
                              Icons.star_border,
                              color: Colors.orange,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
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

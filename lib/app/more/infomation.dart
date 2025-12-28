// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Infomation extends StatefulWidget {
  final Map<String, String> title;
  const Infomation({super.key, required this.title});

  @override
  State<Infomation> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<Infomation> {
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
              itemCount: 50,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Icon(
                                Icons.agriculture_sharp,
                                size: 20,
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              // height: 300,
                              width: 380,
                              decoration: BoxDecoration(
                                // color: Colors.amberAccent,
                              ),
                              child: Text(
                                'Track sleep quality and wrist temperature detection in the Vitals app, offering 18-hour battery life and fast charging. Includes support for various workouts, cellular capabilities for calls and texts at 5G speeds, and safety features like Emergency SOS, Fall Detection, and Crash Detection.',
                                textAlign: TextAlign.left,
                                maxLines: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
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

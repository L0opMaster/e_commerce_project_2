// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/common_widgets/icon_cart_value.dart';
import 'package:flutter_ecommerce/app/more/inbox.dart';
import 'package:flutter_ecommerce/app/more/infomation.dart';
import 'package:flutter_ecommerce/app/more/notification.dart';
import 'package:flutter_ecommerce/app/more/order.dart';
import 'package:flutter_ecommerce/app/more/paymentdetail.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> moreState = [
      {"image": "assets/image/more_payment.png", "title": "Payment Details"},
      {"image": "assets/image/more_inbox.png", "title": "Inbox"},
      {"image": "assets/image/more_my_order.png", "title": "Order"},
      {"image": "assets/image/more_info.png", "title": "Infomation"},
      {"image": "assets/image/more_notification.png", "title": "Notification"},
    ];
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('More', style: Theme.of(context).textTheme.headlineMedium),
        actions: [Iconcartvalue()],
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: moreState.length,
            itemBuilder: (context, index) {
              final more = moreState[index];
              return InkWell(
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PaymentdetailScreen(title: more),
                        ),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InboxScreen(title: more),
                        ),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Order(title: more),
                        ),
                      );
                      break;
                    case 3:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Infomation(title: more),
                        ),
                      );
                      break;
                    case 4:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationScreen(title: more),
                        ),
                      );
                      break;
                    default:
                  }
                },
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Stack(
                    alignment: AlignmentGeometry.centerRight,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        width: double.infinity,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Color(0xFF000000).withOpacity(0.9),
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              spreadRadius: -7,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            Image.asset(
                              more["image"].toString(),
                              height: 40,
                              width: 40,
                              color: colorScheme.primary,
                            ),
                            SizedBox(width: 30),
                            Text(
                              more["title"].toString(),
                              style: Theme.of(context).textTheme.labelMedium
                                  ?.copyWith(color: Colors.black, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // alignment: Alignment.center,
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Color(0xFF000000).withOpacity(0.9),
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              spreadRadius: -7,
                            ),
                          ],
                        ),
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

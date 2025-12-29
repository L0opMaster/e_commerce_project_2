// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/common_widgets/round_textfield.dart';

class PaymentdetailScreen extends StatefulWidget {
  final Map<String, String> title;
  const PaymentdetailScreen({super.key, required this.title});

  @override
  State<PaymentdetailScreen> createState() => _PaymentdetailScreenState();
}

class _PaymentdetailScreenState extends State<PaymentdetailScreen> {
  bool isMore = true;
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: Text(
              'Customize your payment method',
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF777575).withOpacity(0.59),
                  offset: Offset(0, 4),
                  blurRadius: 11,
                  spreadRadius: -3,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cash/ Card on delivery'),
                      Icon(
                        Icons.check,
                        fontWeight: FontWeight.bold,
                        size: 30,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(thickness: 1, height: 1),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/image/visa_icon.png',
                        width: 55,
                        height: 35,
                        fit: BoxFit.cover,
                      ),
                      Text('*** *** *** 376'),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.all(
                              Radius.circular(8),
                            ),
                            side: BorderSide(color: Colors.orange),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Delete Card',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(thickness: 1, height: 1),
                  SizedBox(height: 10),
                  Text('Other method'),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      width: double.infinity,
                      // height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Add Credit card / Debit Card'),
                                SizedBox(height: 10),
                                Divider(height: 1, thickness: 1),
                                SizedBox(height: 10),
                                RoundTextfield(
                                  hintText: 'Card number',
                                  obscureText: false,
                                  padding: EdgeInsets.only(left: 30),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(child: Text('Expirl')),
                                    RoundTextfield(
                                      width: 100,
                                      hintText: 'MM',
                                      padding: EdgeInsets.only(left: 30),
                                      obscureText: false,
                                    ),
                                    SizedBox(width: 40),
                                    RoundTextfield(
                                      width: 100,
                                      hintText: 'YYYY',
                                      padding: EdgeInsets.only(left: 30),
                                      obscureText: false,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                RoundTextfield(
                                  hintText: 'Secuirity Code',
                                  obscureText: false,
                                  padding: EdgeInsets.only(left: 30),
                                ),
                                SizedBox(height: 10),
                                RoundTextfield(
                                  hintText: 'First name',
                                  obscureText: false,
                                  padding: EdgeInsets.only(left: 30),
                                ),
                                SizedBox(height: 10),
                                RoundTextfield(
                                  hintText: 'Last name',
                                  obscureText: false,
                                  padding: EdgeInsets.only(left: 30),
                                ),
                                SizedBox(height: 10),

                                Text('You can remove this card anytime'),
                                SizedBox(height: 10),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20.0,
                                    ),
                                    child: Text('Add other card'),
                                  ),
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(30),
                ),
              ),
              label: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text('Add Other Card / Debit Card'),
              ),
              icon: Icon(Icons.add, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}

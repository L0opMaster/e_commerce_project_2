import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/cart/cart_screen.dart';
import 'package:flutter_ecommerce/app/common_widgets/round_textfield.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Profile',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: colorScheme.surface),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 20),
            child: IconButton(
              onPressed: () {
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                };
              },
              icon: Icon(
                Icons.shopping_cart,
                color: colorScheme.surface,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        primary: true,
        padding: EdgeInsets.only(bottom: 35),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/image/luffy.jpg',
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {},
                label: Text(
                  'Edit profile',
                  style: TextStyle(color: colorScheme.primary, fontSize: 12),
                ),
                icon: Icon(Icons.edit, color: colorScheme.primary, size: 15),
              ),
              Text(
                'Hi, there Luffy!',
                style: TextStyle(
                  color: colorScheme.secondary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Sign out', style: TextStyle(fontSize: 12)),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 25),
                    RoundTextfield(
                      left: 30,
                      top: 10,
                      title: 'name',
                      hintText: 'Name',
                      height: 80,
                      obscureText: false,
                      padding: EdgeInsets.only(left: 40),
                    ),
                    SizedBox(height: 15),
                    RoundTextfield(
                      hintText: 'Email',
                      title: 'email',
                      height: 80,
                      obscureText: false,
                      padding: EdgeInsets.only(left: 40),
                      left: 30,
                      top: 10,
                    ),
                    SizedBox(height: 15),
                    RoundTextfield(
                      hintText: 'Mobilo No',
                      title: 'mobile no',
                      height: 80,
                      obscureText: false,
                      padding: EdgeInsets.only(left: 40),
                      left: 30,
                      top: 10,
                    ),
                    SizedBox(height: 15),
                    RoundTextfield(
                      hintText: 'Address',
                      title: 'address',
                      height: 80,
                      obscureText: false,
                      padding: EdgeInsets.only(left: 40),
                      left: 30,
                      top: 10,
                    ),
                    SizedBox(height: 15),
                    RoundTextfield(
                      hintText: 'Password',
                      title: 'password',
                      height: 80,
                      obscureText: false,
                      padding: EdgeInsets.only(left: 40),
                      left: 30,
                      top: 10,
                    ),
                    SizedBox(height: 15),
                    RoundTextfield(
                      hintText: 'Confirm Password',
                      title: 'confirm password',
                      height: 80,
                      obscureText: false,
                      padding: EdgeInsets.only(left: 40),
                      left: 30,
                      top: 10,
                    ),
                    SizedBox(height: 25),
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('Save'),
                      ),
                      icon: Icon(Icons.save),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

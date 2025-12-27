import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
      child: SearchBar(
        leading: const Icon(Icons.search),
        hintText: 'Search',
        backgroundColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.surface,
        ),
        shadowColor: WidgetStateProperty.all(Colors.black),
        elevation: WidgetStateProperty.all(4.0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20.0),
          ),
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }
}

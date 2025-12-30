// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/app/model/ecomdata/eproduct.dart';

class SearchAnChor extends StatelessWidget {
  final List<Eproduct> product;
  final Function(Eproduct) onSelected;
  final Function(String) onChanged;

  const SearchAnChor({
    super.key,
    required this.product,
    required this.onSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 8, right: 8),
      child: SearchAnchor(
        viewElevation: 1,
        keyboardType: TextInputType.text,
        viewSide: BorderSide(width: 1, color: Colors.black),
        builder: (context, controller) {
          return SearchBar(
            controller: controller,
            side: WidgetStateProperty.all(
              BorderSide(width: 0.5, color: Colors.black26),
            ),
            surfaceTintColor: WidgetStateProperty.all(Colors.white),
            backgroundColor: WidgetStateProperty.all(Colors.white),
            leading: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(Icons.search),
            ),
            hintText: 'Search...',
            onChanged: onChanged,
            trailing: [
              if (controller.text.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    // controller.clear();
                    onChanged(''); // reset search -> GridView
                  },
                ),
            ],
          );
        },
        suggestionsBuilder: (context, controller) {
          final query = controller.text.toLowerCase();
          final filtered = product
              .where((p) => p.name.toLowerCase().contains(query))
              .toList();

          return filtered.map((p) {
            return ListTile(
              title: Text(p.name),
              onTap: () {
                controller.closeView(p.name);

                // keep ListView state
                onChanged(p.name);
                onSelected(p);
              },
            );
          }).toList();
        },
      ),
    );
  }
}

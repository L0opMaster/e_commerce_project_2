import 'package:flutter/material.dart';

class RoundManuTabButton extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final VoidCallback onTab;
  const RoundManuTabButton({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTab,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: isSelected ? 23 : 18,
            height: isSelected ? 23 : 18,
            color: isSelected
                ? colorScheme.surface
                : colorScheme.surface, // ✅ theme based
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: isSelected ? 12 : 10,
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? colorScheme.surface
                  : colorScheme.surface, // ✅ theme based
            ),
          ),
        ],
      ),
    );
  }
}

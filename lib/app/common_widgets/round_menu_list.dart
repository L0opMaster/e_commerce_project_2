// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RoundMenuList extends StatelessWidget {
  final String title;
  final String iteamcount;
  final VoidCallback onTab;
  final String imageUrl;
  const RoundMenuList({
    super.key,
    required this.title,
    required this.iteamcount,
    required this.onTab,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTab,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // White card (theme-aware)
            Container(
              width: media.width * 0.85,
              height: media.height * 0.1,
              margin: const EdgeInsets.only(left: 20, right: 50),
              decoration: BoxDecoration(
                color: Colors.white, // ✅ theme-aware background
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),

            // Image
            Positioned(
              left: 0,
              top: 9,
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(imageUrl, fit: BoxFit.cover),
              ),
            ),

            // Text
            Positioned(
              left: 110,
              top: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.labelLarge?.copyWith(
                      color: colorScheme.onSurface, // ✅ theme-aware
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    iteamcount,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant, // ✅ theme-aware
                    ),
                  ),
                ],
              ),
            ),

            // Next Button
            Positioned(
              left: 340,
              top: 30,
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, // ✅ theme-aware
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/image/btn_next.png',
                  color: colorScheme.primary, // ✅ theme-aware icon
                  width: 8,
                  height: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

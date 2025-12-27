import 'package:flutter/material.dart';

class ComfirmCheckout extends StatelessWidget {
  const ComfirmCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Confirm Checkout',
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(fontSize: 25),
            ),
            SizedBox(height: 20),
            Text(
              'Are you sure you want to proceed with your purchase?',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                ElevatedButton(
                  // style: ElevatedButton.styleFrom(
                  //   backgroundColor: Colors.transparent,
                  //   foregroundColor: Colors.transparent,
                  //   surfaceTintColor: Colors.transparent,
                  //   elevation: 0,
                  // ),
                  onPressed: () {},
                  child: Text(
                    'Confirm',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

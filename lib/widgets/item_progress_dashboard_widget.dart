import 'package:flutter/material.dart';

class ItemCountBoard extends StatelessWidget {
  final String itemCount, itemName;

  final Color cardBackgroundColor;

  const ItemCountBoard(
      {super.key, required this.itemCount, required this.itemName, required this.cardBackgroundColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),
      color: cardBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemCount,
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
            ),
            const SizedBox(
              height: 8,
            ),
            FittedBox(
              child: Text(
                itemName,
                style:
                const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
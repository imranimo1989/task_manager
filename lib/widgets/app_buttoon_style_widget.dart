import 'package:flutter/material.dart';

class AppButtonStyleWidget extends StatelessWidget {




  const AppButtonStyleWidget({super.key,
    required this.child, required this.onPressed
  });

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
        onPressed: onPressed,
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: const EdgeInsets.symmetric(vertical: 14),
    ),
    child: child,
    ));
  }
}
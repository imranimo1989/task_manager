import 'package:flutter/material.dart';

class TopProfileBar extends StatelessWidget {
  final VoidCallback onPressed;
  final userName, userEmail;


  const TopProfileBar(
      {super.key, required this.userName, required this.userEmail, required this.onPressed, });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.green,
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(userName),
      subtitle: Text(userEmail),
      onTap: onPressed,
    );
  }
}
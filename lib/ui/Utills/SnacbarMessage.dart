
import 'package:flutter/material.dart';

snackBarMessage(context, msg , [bool error = false]){

  ScaffoldMessenger.of(context).showSnackBar(

       SnackBar(
          backgroundColor: error ? Colors.red : Colors.green,
          content:
          Text(msg)));

}


import 'package:flutter/material.dart';

@override
Widget customButton(
    {required BuildContext context,
    required IconData icon,
    required VoidCallback onPressed}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(18),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      onPressed: onPressed,
      child: Icon(icon));
}

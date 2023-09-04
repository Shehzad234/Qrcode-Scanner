import 'package:flutter/material.dart';

@override
Widget landingViewButton(
    {required BuildContext context,
    required iconPath,
    required String title,
    required VoidCallback onTap}) {
  return Column(
    children: [
      GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(70)),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(15),
          child: Image.asset(
            iconPath,
            width: 100,
            height: 100,
          ),
        ),
      ),
      Text(title,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline)),
    ],
  );
}

  import 'package:flutter/material.dart';

Row servicePoints(String text3) {
    return Row(
      children: [
        const Icon(
          Icons.circle,
          size: 8,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(text3),
      ],
    );
  }

  Text content(String text2) {
    return Text(
      text2,
      style: const TextStyle(color: Colors.white38),
    );
  }

  SizedBox spacing(double height) {
    return SizedBox(
      height: height,
    );
  }

  Text headings(String text1) {
    return Text(
      text1,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
    );
  }
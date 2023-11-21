
 import 'package:flutter/material.dart';

Row chartValues({required Color color, String? text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(7)),
        ),
        const SizedBox(width: 15,),
        Text(text!, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),)
      ],
    );
  }
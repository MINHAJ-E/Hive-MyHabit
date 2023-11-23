 import 'package:flutter/material.dart';

Column featuresAdd({required String text1,String? text2}) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.circle,size: 6,),
                      const SizedBox(width: 10,),
                      Text(text1,style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.white54),),
                    ],
                  ),
                  makeSpace(5),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(text2!,style: const TextStyle(color: Colors.white54),),
                    
                  ),
                  makeSpace(8),
                ],
              );
  }

  Text hedings(String text) {
    return Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.w700,color: Colors.white54),
              );
  }

  SizedBox makeSpace(double? height) {
    return SizedBox(
      height: height,
    );
  }
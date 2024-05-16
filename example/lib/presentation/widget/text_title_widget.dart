import 'package:example/config/foundations/custom_typo.dart';
import 'package:flutter/material.dart';

class TextTittleWidget extends StatelessWidget {
  final String tittle;
  final FontWeight fontWeight;
  final double size;
  const TextTittleWidget(
      {super.key,
      required this.tittle,
      this.fontWeight = FontWeight.bold,
      this.size = 14.0});

  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      style: TextStyle(
          fontFamily: CustomTypo.poppinsFontFamily,
          fontWeight: fontWeight,
          fontSize: size),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

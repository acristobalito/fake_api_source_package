import 'package:example/presentation/widget/text_title_widget.dart';
import 'package:flutter/material.dart';

class RatingContainerWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const RatingContainerWidget(
      {super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Icon(icon), TextTittleWidget(tittle: text)],
    );
  }
}

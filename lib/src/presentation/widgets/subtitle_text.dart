import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubtitleText extends StatelessWidget {
  final String text;
  const SubtitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text.tr, style: Theme.of(context).textTheme.titleLarge);
  }
}
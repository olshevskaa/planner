import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyText extends StatelessWidget {
  final String text;
  final Color? color;
  const BodyText({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: color ?? Theme.of(context).colorScheme.onBackground,
          ),
    );
  }
}

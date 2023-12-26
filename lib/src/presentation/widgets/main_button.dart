import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planner/core/utils/dimensions.dart';
import 'package:planner/src/presentation/widgets/body_text.dart';


class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const MainButton({
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Dimensions.mainButtonWidth,
        height: Dimensions.mainButtonHeight,
        padding: EdgeInsets.all(Dimensions.height10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(Dimensions.radius15),
        ),
        child: BodyText(
          text: text.tr,
        ),
      ),
    );
  }
}

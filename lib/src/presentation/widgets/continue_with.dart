import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planner/core/utils/dimensions.dart';
import 'package:planner/src/presentation/controllers/auth_service.dart';
import 'package:planner/src/presentation/widgets/body_text.dart';

class ContinueWith extends StatelessWidget {
  ContinueWith({super.key});

  final AuthService authService = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Divider(
                thickness: 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width8),
              child: const BodyText(text: 'continueWith'),
            ),
            const Expanded(
              child: Divider(
                thickness: 2,
              ),
            ),
          ],
        ),
        SizedBox(height: Dimensions.height10 * 2),
        GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: Dimensions.height15 * 2,
            width: Dimensions.height15 * 2,
            child: InkWell(
              onTap: () => authService.googleAuth(),
              child: const Image(
                image: AssetImage(
                  'assets/images/google_logo.png',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

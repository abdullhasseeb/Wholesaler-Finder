

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../screens/reviews/widgets/webview.dart';

class HkOutlinedText extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final VoidCallback onTap;
  const HkOutlinedText({
    super.key,
    this.color = Colors.transparent,
    required this.text,
    this.textColor = HkColors.primary, required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(HkSizes.googleImagesRadius),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(HkSizes.sm/2),
        decoration: BoxDecoration(
          color: color,
            border: Border.all(color: HkColors.primary),
            borderRadius: BorderRadius.circular(HkSizes.googleImagesRadius)
        ),
        child:  Text(text, style: Theme.of(context).textTheme.labelLarge!.apply(
            color: textColor,
            fontWeightDelta: 2
        )),

      ),
    );
  }
}
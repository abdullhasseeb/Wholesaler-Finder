
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class HkEditIcon extends StatelessWidget {
  const HkEditIcon({
    super.key,
    this.width = 35,
    this.height = 35,
    this.iconSize = HkSizes.iconSm,
    required this.onPressed,
  });

  final double width, height, iconSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: HkColors.darkerGrey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(100)
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.edit),
        color: Colors.white,
        iconSize: iconSize,
      ),
    );
  }
}
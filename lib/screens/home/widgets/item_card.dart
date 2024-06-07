import 'package:flutter/material.dart';
import 'package:poi_maps/screens/home/controller/home_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';

class HkItemCard extends StatelessWidget {
  final int index;
  const HkItemCard({
    super.key, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: HkColors.primary.withAlpha(30),
            borderRadius: BorderRadius.circular(HkSizes.cardRadiusLg),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 3,
                  color: HkColors.primary.withOpacity(0.2)
              )
            ]
        ),
        child: Image(
          image: AssetImage(HomeController.instance.categoryIcons[index]),
          height: HkSizes.iconLg,
          width: HkSizes.iconLg,
          color: HkColors.primary,
        )
    );
  }
}
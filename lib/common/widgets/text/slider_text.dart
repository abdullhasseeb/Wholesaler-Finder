


import 'package:flutter/material.dart';
import 'package:poi_maps/utils/constants/colors.dart';
import 'package:poi_maps/utils/constants/sizes.dart';

class HkSliderText extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String subtitle;
  final double discount;
  const HkSliderText({super.key, this.onTap, required this.title, required this.subtitle, required this.discount});

  @override
  Widget build(BuildContext context) {


    // Calculate the number of digits in the discount
    int discountDigits = discount.toInt().toString().length;

    // Determine the font size based on the number of digits
    double fontSize;
    if (discountDigits == 1) {
      fontSize = 120;
    } else if (discountDigits == 2) {
      fontSize = 100;
    } else {
      fontSize = 70;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(HkSizes.lg * 1.5),
          color: HkColors.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:HkSizes.spaceBtwItems,horizontal: HkSizes.spaceBtwItems),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    Text(title,
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold,color: HkColors.white)),

                    /// Subtitle
                    Text(subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold,fontSize: 10,color: HkColors.white))
                  ],
                ),
              ),
              Row(
                children: [
                  /// Discount Text
                  Text(discount.toInt().toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: fontSize,color: HkColors.white),),

                  /// % Symbol
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text('%',style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 40,color: HkColors.white),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

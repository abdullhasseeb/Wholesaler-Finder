
import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/constants/images.dart';

class HkLoginHeader extends StatelessWidget {
  const HkLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Image(
            height: 120 ,
            image: AssetImage(HkImages.logo)),
        const SizedBox(height: HkSizes.xl),
        Text("Welcome back,", style: Theme.of(context).textTheme.headlineSmall,),
        Text(
          "Discover Limitless Choices and Unmatched Convenience.",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,),
      ],
    );
  }
}
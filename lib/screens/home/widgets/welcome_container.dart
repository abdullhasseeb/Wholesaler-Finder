import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class HkWelcomeContainer extends StatelessWidget {
  const HkWelcomeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: const BoxDecoration(
          color: HkColors.primary,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(HkSizes.homeCardRadius),
              bottomLeft: Radius.circular(HkSizes.homeCardRadius)
          )
      ),
      child: Center(child: Text('Welcome Back',style: Theme.of(context).textTheme.headlineLarge!.apply(color: HkColors.white),)),
    );
  }
}
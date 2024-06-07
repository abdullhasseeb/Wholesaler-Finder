








import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class HkOptionsCard extends StatelessWidget {
  const HkOptionsCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          decoration: BoxDecoration(
              color: dark ? HkColors.darkerGrey : Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0,1),
                    color: HkColors.black.withOpacity(0.2)
                )
              ]
          ),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: HkSizes.spaceBtwItems,),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
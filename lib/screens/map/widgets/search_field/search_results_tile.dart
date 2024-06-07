


import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:poi_maps/utils/constants/colors.dart';

import '../../../../common/widgets/icons/circular_icon.dart';
import '../../../../utils/constants/sizes.dart';

class HkSearchResultsTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  const HkSearchResultsTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
          title: Text(title,style: Theme.of(context).textTheme.bodyLarge!.apply(color: HkColors.primary),),
          subtitle: Text(subTitle,style: Theme.of(context).textTheme.labelMedium,),
          trailing: const InkWell(
              child: HkCircularIcon(
                  height: 35,
                  width: 35,
                  size: HkSizes.md,
                  icon: Iconsax.arrow_right_3)
          )
      ),
    );
  }
}
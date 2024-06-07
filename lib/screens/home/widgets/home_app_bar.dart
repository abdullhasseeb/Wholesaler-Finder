



import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:poi_maps/screens/home/widgets/search_field/search_field_and_results.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';

class HkHomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HkHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: HkColors.primary,
        leading: const Icon(Iconsax.menu_1,color: HkColors.white,size: HkSizes.iconLg),
        actions: const [
          Icon(Iconsax.profile_circle, color: HkColors.white,size: HkSizes.iconLg,),
          SizedBox(width: HkSizes.spaceBtwItems/1.5,)
        ],
      centerTitle: true,
      title: Text('Home',style: Theme.of(context).textTheme.headlineMedium!.apply(color: HkColors.white),),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(HkDeviceUtils.getAppBarHeight());


}




import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:poi_maps/utils/helpers/helper_functions.dart';

import '../../styles/spacing_styles.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../screens/map/controller/map_controller.dart';

class HkHomeTextField extends StatelessWidget {
  const HkHomeTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: dark ? HkColors.darkerGrey : HkColors.white,
          borderRadius: BorderRadius.circular(HkSizes.inputFieldRadius)
      ),
      child: TextFormField(

        controller: TextEditingController(),
        onChanged: (value){

        } ,
        decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Iconsax.search_normal,
              color: dark ? HkColors.white : HkColors.black,
              size: HkSizes.iconMd,
            )
        ),
      ),
    );
  }
}
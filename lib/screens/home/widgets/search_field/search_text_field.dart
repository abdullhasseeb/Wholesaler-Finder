



import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:poi_maps/screens/home/controller/home_controller.dart';
import 'package:poi_maps/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class HkSearchTextField extends StatelessWidget {
  const HkSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
          color: dark ? HkColors.darkerGrey : HkColors.white,
          borderRadius: BorderRadius.circular(HkSizes.inputFieldRadius)
      ),
      child: TextFormField(
        controller: HomeController.instance.searchController,
        onChanged: (value){
          /// fill the search Text
          HomeController.instance.searchText.value = value;

          /// filter the data
          HomeController.instance.getFilteredMarker();

        } ,
        decoration: InputDecoration(
            hintText: 'Search wholesalers',
            prefixIcon: Icon(Iconsax.search_normal,
              color: dark ? HkColors.white : HkColors.black,)
        ),
      ),
    );
  }
}
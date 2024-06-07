


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:poi_maps/common/styles/spacing_styles.dart';
import 'package:poi_maps/common/widgets/icons/circular_icon.dart';
import 'package:poi_maps/screens/authentication/profile/widgets/circular_image.dart';
import 'package:poi_maps/screens/map/controller/map_controller.dart';
import 'package:poi_maps/screens/map/widgets/search_field/search_results_list.dart';
import 'package:poi_maps/common/widgets/textfields/search_textfield.dart';
import 'package:poi_maps/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';
import '../map_category_dropdown.dart';


class SearchFieldAndResults extends StatelessWidget {
  const SearchFieldAndResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /// TextField for Search
        Padding(
          padding: HkSpacingStyle.mapSearchTextFieldPadding,
          child: HkSearchTextField(),
        ),

        /// Box to show the results while searching
        HkSearchResultsList()
      ],
    );
  }
}




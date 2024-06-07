import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_maps/screens/map/controller/map_controller.dart';

import '../../../common/widgets/text/section_heading.dart';
import '../../../utils/constants/sizes.dart';

class HkMapCategoryDropDown extends StatelessWidget {
  const HkMapCategoryDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            DropdownButton<String>(
              /// Value like 'Mobile', 'Food' and Electronics
              value: controller.selectedCategory.value,
              onChanged: (String? newValue) {
                controller.selectedCategory.value = newValue!;
              },

              /// All The Items of the DropDownMenu
              items: controller.allCategories.value.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),

              /// Styling of Drop down
              padding: const EdgeInsets.symmetric(horizontal: HkSizes.sm),
              elevation: 2,
              underline: Container(),
              borderRadius: BorderRadius.circular(HkSizes.cardRadiusLg),
              menuMaxHeight: 200,
            ),
          ],
        ));
  }
}

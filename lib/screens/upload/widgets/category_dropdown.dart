


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:poi_maps/common/widgets/text/section_heading.dart';
import 'package:poi_maps/utils/constants/sizes.dart';
import '../../../utils/constants/colors.dart';
import '../controller/upload_controller.dart';

class HkCategoryDropDown extends StatelessWidget {
  const HkCategoryDropDown({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadController());
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /// Category Heading
          const HkSectionHeading(title: 'Category :'),

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
      )
    );
  }
}
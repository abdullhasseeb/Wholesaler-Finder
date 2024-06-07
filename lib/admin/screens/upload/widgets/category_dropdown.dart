


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_maps/admin/screens/upload/controller/upload_controller.dart';

class HkCategoryDropDown extends StatelessWidget {
  const HkCategoryDropDown({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadController());
    return Obx(
      () => DropdownButton<String>(
        value: controller.selectedCategory.value,
        onChanged: (String? newValue) {
          controller.selectedCategory.value = newValue!;
        },
        items: controller.allCategories.value.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        menuMaxHeight: 150,
      ),
    );
  }
}
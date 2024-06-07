

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_maps/admin/screens/upload/controller/upload_controller.dart';
import 'package:poi_maps/admin/screens/upload/widgets/category_dropdown.dart';
import 'package:poi_maps/admin/screens/upload/widgets/name_textfield.dart';

import '../../../utils/constants/sizes.dart';


class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadController());
    return Scaffold(
      appBar: AppBar(),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const Center(child: HkCategoryDropDown()),
                const SizedBox(height: HkSizes.spaceBtwItems,),

                Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Name TextField
                      const HkNameTextField(),
                      const SizedBox(height: HkSizes.spaceBtwSections,),

                      /// Upload Data Button
                      ElevatedButton(onPressed: () async{
                        await controller.uploadData();
                      } , child: const Text('Upload'))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}





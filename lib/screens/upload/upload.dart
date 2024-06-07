import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poi_maps/common/widgets/appbar/appbar.dart';
import 'package:poi_maps/screens/upload/widgets/category_dropdown.dart';
import 'package:poi_maps/screens/upload/widgets/name_textfield.dart';
import 'package:poi_maps/screens/upload/widgets/upload_form.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import 'controller/upload_controller.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadController());
    return Scaffold(
      appBar: HkAppBar(
        title: Text(
          'Selected',
          style: Theme.of(context).textTheme.headlineMedium!.apply(color: HkColors.white),
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: HkSizes.spaceBtwSections * 2,),
              /// DropDown Menu for selecting category
              Text("Let's Contribute by adding this wholesaler",style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: HkSizes.spaceBtwItems,),
        
              /// Form to Upload
              Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Name TextField
                    const HkNameTextField(),
                    const SizedBox(height: HkSizes.spaceBtwItems,),
        
                    ///Category Heading and DropDown Menu
                    const HkCategoryDropDown(),
                    const SizedBox(height: HkSizes.spaceBtwSections * 3,),
        
                    /// Add into Map  Button
                    SizedBox(
                      width: double.infinity,
                      child: Obx(
                        () => ElevatedButton(
                            onPressed: () async {
                              await controller.uploadData();
                            },
                            child: controller.buttonLoading.value
                                ?
                            const SizedBox(height:22,width:22,child: CircularProgressIndicator(color: HkColors.white,))
                                :
                            const Text('Add')),
                      ),
                    )
                  ],
                ),
              ),
        
        
            ],
          ),
        ),
      ),
    );
  }
}

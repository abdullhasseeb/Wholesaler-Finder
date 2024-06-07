

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:poi_maps/common/widgets/images/google_image.dart';
import 'package:poi_maps/common/widgets/text/section_heading.dart';
import 'package:poi_maps/screens/map/controller/map_controller.dart';
import 'package:poi_maps/screens/map/map.dart';
import 'package:poi_maps/screens/map/widgets/marker/rating_indicator.dart';
import 'package:poi_maps/screens/map/widgets/marker/reviews_list.dart';
import 'package:poi_maps/utils/helpers/helper_functions.dart';
import 'package:poi_maps/utils/shimmer/shimmer_effect.dart';
import 'package:readmore/readmore.dart';

import '../../common/widgets/images/circular_image.dart';
import '../../common/widgets/images/rounded_image.dart';
import '../../screens/map/controller/marker_controller.dart';
import '../../screens/map/widgets/marker/marker_details.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';

class HkDialogFunctions{
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: HkColors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon:  const Icon(Iconsax.warning_2, color: HkColors.white,)
    );
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
        title,
        message.toString(),
        isDismissible: true,
        shouldIconPulse: true,
        colorText: HkColors.white,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: HkColors.white,)
    );
  }

  static successSnackBar({required title, message = '', duration = 3}){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: HkColors.primary,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(10),
        icon: const Icon(Iconsax.check,color:  HkColors.white)
    );
  }

  static openBottomSheet(){

    final controller = Get.put(MarkerController());

    showMaterialModalBottomSheet(
      context: Get.context!,
      expand: false,
      useRootNavigator: false,
      builder:(context) {
        return SizedBox(
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(HkSizes.sm),
            child:  Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Banner Image
                  !controller.detailsLoading.value ?
                  HkGoogleImage(
                    imageBytes: controller.imageData.value,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: HkSizes.googleImagesHeight,
                  ) :
                  const HkShimmerEffect(radius: HkSizes.googleImagesRadius, width: double.infinity, height: HkSizes.googleImagesHeight),

                  const SizedBox(height: HkSizes.spaceBtwItems),


                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(HkSizes.md / 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Marker Details Name, Buttons
                          MarkerDetails(),

                          SizedBox(height: HkSizes.spaceBtwItems,),

                          /// Reviews Heading with View all
                          HkSectionHeading(title: 'Reviews'),

                          Divider(),

                          /// List of Reviews
                          HkReviewsList()

                        ],
                      ),
                    ),
                  )


                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static showDialogBox(){
    return showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: Text(''),
          );
        },
    );
  }

  // static openFilterDialogBox(){
  //   return showDialog(
  //       context: Get.context!,
  //       builder: (context) {
  //         final categories = MapController.instance.allCategories.value;
  //         return AlertDialog(
  //           content: SizedBox(
  //             height: 200,
  //             child: ListView.builder(
  //               itemCount: categories.length,
  //                 itemBuilder: (context, index) {
  //                   return InkWell(
  //                     /// Selected Category changed as per selected category
  //                     onTap: () async{
  //
  //                       MapController.instance.selectedCategory.value = categories[index];
  //
  //                       MapController.instance.markersFilterBasedOnCategory(categories[index]);
  //
  //                       Get.back();
  //
  //                       await MapController.instance.loadMarkers();
  //                     } ,
  //
  //                     child: Card(
  //                       child: Padding(
  //                         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
  //                         child: Text(MapController.instance.allCategories.value[index]),
  //                       ),
  //                     ),
  //                   );
  //                 },
  //             ),
  //           ),
  //         );
  //       },
  //   );
  // }
}
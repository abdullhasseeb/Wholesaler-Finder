





import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_maps/screens/authentication/controller/user_controller.dart';
import 'package:poi_maps/screens/authentication/profile/widgets/circular_image.dart';
import 'package:poi_maps/utils/helpers/helper_functions.dart';
import 'package:poi_maps/utils/shimmer/shimmer_effect.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../screens/authentication/profile/widgets/edit_icon.dart';

class HkProfileHeading extends StatelessWidget {
  const HkProfileHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final dark = HkHelperFunctions.isDarkMode(context);
    return Row(
        children: [
          /// Profile Picture
           Stack(
            children: [
              Obx((){
                String networkImage = controller.user.value.profilePicture;
                final image = networkImage.isNotEmpty ? networkImage : HkImages.profileIcon;
                return controller.imageUploading.value
                    ? const HkShimmerEffect(width: 80, height: 80, radius: 80,)
                    : HkCircularImage(image: image,height: 80,width: 80,isNetworkImage: networkImage.isNotEmpty,);
              }),
              Positioned(top: 0, right: 0, child: HkEditIcon(onPressed: () => controller.uploadUserProfilePicture(),),),
            ],
          ),
          const SizedBox(width: HkSizes.spaceBtwItems,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Name
              Obx(() {
                if(controller.profileLoading.value){
                  // Display a shimmer loader while user profile is being loaded
                  return const HkShimmerEffect(width: 100, height: 18);
                }else{
                  return Text(
                    controller.user.value.fullName,
                    style: Theme.of(context).textTheme.titleLarge!.apply(color: dark ? HkColors.white : HkColors.primary),
                  );
                }

              } ),

              /// Email
              Obx((){
                if(controller.profileLoading.value){
                  // Display a shimmer loader while user profile is being loaded
                  return const Column(
                    children: [
                      SizedBox(height: 5,),
                      HkShimmerEffect(width: 150, height: 10)
                    ],
                  );
                } else{
                  return Text(
                    controller.user.value.email,
                    style: Theme.of(context).textTheme.labelMedium,
                  );
                }
              })
            ],
          )
        ]
    );
  }
}


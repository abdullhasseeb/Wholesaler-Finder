import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController());

    return Positioned(
      top: HkDeviceUtils.getAppBarHeight(),
      right: HkSizes.defaultSpace,
      child: Obx(
        () => TextButton(
          onPressed: () => controller.skipPage(),
          child: controller.currentIndex.value != 2 ? const Text('Skip') : const SizedBox(),),
      ),);
  }
}
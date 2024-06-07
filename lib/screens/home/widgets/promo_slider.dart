

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poi_maps/common/widgets/text/slider_text.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../common/widgets/container/circular_container.dart';
import '../controller/home_controller.dart';

class HkPromoSlider extends StatelessWidget {
  const HkPromoSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Obx(
        () => Column(
        children: [
          CarouselSlider(
              items: controller.bannerDataList.value.map((bannerData) => HkSliderText(
                title: bannerData.title!,
                subtitle: bannerData.subtitle!,
                discount: bannerData.discount!.toDouble(),
              )).toList(),
              options: CarouselOptions(
                  viewportFraction: 1,
                onPageChanged:  (index, reason) => controller.updatePageIndicator(index),
              )),
          const SizedBox(height: HkSizes.spaceBtwItems,),
          Obx(
            ()=> Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for(int i = 0; i < controller.bannerDataList.value.length; i++)
                    HkCircularContainer(
                      width: 10,height: 10,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor: (controller.carouselCurrentIndex.value == i) ? HkColors.primary : HkColors.grey ,
                    )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
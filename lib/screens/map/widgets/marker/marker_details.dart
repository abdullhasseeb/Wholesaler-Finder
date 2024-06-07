



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_maps/screens/map/controller/map_controller.dart';
import 'package:poi_maps/screens/map/widgets/marker/rating_indicator.dart';
import 'package:poi_maps/common/widgets/text/outlined_text.dart';
import 'package:poi_maps/screens/reviews/reviews.dart';
import 'package:poi_maps/utils/constants/colors.dart';
import 'package:poi_maps/utils/shimmer/shimmer_effect.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../reviews/widgets/webview.dart';
import '../../controller/marker_controller.dart';

class MarkerDetails extends StatelessWidget {
  const MarkerDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          !MarkerController.instance.detailsLoading.value ?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Name
              Flexible(
                child: Text(
                  MarkerController.instance.name.value,
                  style: Theme.of(context).textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              
              /// Write a Review
              HkOutlinedText(text: 'Write a review',onTap: () => Get.to(() => const HkWebView()),)
              
            ],
          )
          : const Padding(
            padding: EdgeInsets.only(bottom: HkSizes.sm / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HkShimmerEffect(width: 100, height: HkSizes.lg),
                HkShimmerEffect(width: 80, height: HkSizes.lg),
              ],
            ),
          ),
          const SizedBox(height: HkSizes.spaceBtwItems/10,),

          !MarkerController.instance.detailsLoading.value ?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  /// Rating
                  Text(
                    MarkerController.instance.rating.value.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,),
                  const SizedBox(width: HkSizes.sm,),

                  /// Rating Stars
                  HkRatingBarIndicator(rating: MarkerController.instance.rating.value)
                ],
              ),

              /// Directions Button
              HkOutlinedText(text: 'Directions',
              color: HkColors.primary,
              textColor: HkColors.white,
                onTap: () => MarkerController.instance.getDirections(),
              )
            ],
          )
              : const HkShimmerEffect(width: 150, height: HkSizes.md)
        ],
      ),
    );
  }
}


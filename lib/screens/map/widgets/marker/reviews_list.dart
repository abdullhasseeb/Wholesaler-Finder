
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_maps/screens/map/controller/marker_controller.dart';
import 'package:poi_maps/screens/map/widgets/marker/profile_and_name.dart';
import 'package:poi_maps/screens/map/widgets/marker/rating_and_time.dart';
import 'package:poi_maps/screens/map/widgets/marker/review_text.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/marker_details_model.dart';

class HkReviewsList extends StatelessWidget {
  const HkReviewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: MarkerController.instance.reviewsLoading.value
            ?
        const Center(child: CircularProgressIndicator(color: HkColors.primary,))
            :
        MarkerController.instance.reviewsList.value.length.isEqual(0) ?
            const Center(child: Text('No reviews')) :
        ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: MarkerController.instance.reviewsList.value.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            Reviews review = MarkerController.instance.reviewsList.value[index];
            return Column(
              children: [

                /// Author Profile and Name
                HkAuthorProfileAndName(review: review),

                /// Author Rating and Publish Time
                HkRatingAndTime(review: review,),

                const SizedBox(height: HkSizes.sm,),

                /// Author Review Text
                HkReviewText(review: review)


              ],
            );

          },


        ),
      ),
    );
  }
}

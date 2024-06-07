




import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:poi_maps/screens/reviews/controller/reviews_controller.dart';
import 'package:poi_maps/utils/constants/sizes.dart';

class HkFunctionalRating extends StatelessWidget {
  const HkFunctionalRating({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewsController());

    return Obx(
      () => Column(
        children: <Widget>[
          RatingBar.builder(
            initialRating: controller.currentRating.value,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemSize: 40,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) =>
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
            onRatingUpdate: (rating) {
              controller.currentRating.value = rating;
            },
            updateOnDrag: true,
          ),
          const SizedBox(height: HkSizes.spaceBtwItems),
          Text(
            'You have rated: ${controller.currentRating.value} stars',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

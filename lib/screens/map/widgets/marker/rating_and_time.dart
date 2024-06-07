



import 'package:flutter/material.dart';
import 'package:poi_maps/screens/map/models/marker_details_model.dart';
import 'package:poi_maps/screens/map/widgets/marker/rating_indicator.dart';

import '../../../../utils/constants/sizes.dart';

class HkRatingAndTime extends StatelessWidget {
  final Reviews review;
  const HkRatingAndTime({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Author Rating
        HkRatingBarIndicator(rating: review.rating!.toDouble()),
        const SizedBox(width: HkSizes.sm,),

        /// Author review Publish time
        Text(review.relativeTimeDescription.toString(), style: Theme.of(context).textTheme.labelMedium,)
      ],
    );
  }
}

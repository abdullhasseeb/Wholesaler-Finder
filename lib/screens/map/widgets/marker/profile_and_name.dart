import 'package:flutter/material.dart';
import 'package:poi_maps/screens/map/models/marker_details_model.dart';

import '../../../../common/widgets/images/circular_image.dart';
import '../../../../utils/constants/sizes.dart';

class HkAuthorProfileAndName extends StatelessWidget {
  final Reviews review;
  const HkAuthorProfileAndName({
    super.key,
    required this.review
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        /// Author Profile Pic
        HkCircularImage(image: review.profilePhotoUrl.toString(), isNetworkImage: true,),
        const SizedBox(width: HkSizes.sm,),

        /// Author Name
        Text(review.authorName.toString(), style: Theme.of(context).textTheme.bodyLarge,)
      ],
    );
  }
}

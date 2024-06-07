


import 'package:flutter/material.dart';
import 'package:poi_maps/screens/map/models/marker_details_model.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/colors.dart';

class HkReviewText extends StatelessWidget {
  final Reviews review;
  const HkReviewText({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ReadMoreText(
        review.text.toString(),
        style: Theme.of(context).textTheme.labelSmall!.apply(fontWeightDelta: 2),
        trimLines: 3,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'show more',
        trimExpandedText: 'show less',
        moreStyle: Theme.of(context).textTheme.labelMedium!.apply(
            color: HkColors.black,
            fontWeightDelta: 2
        ),
        lessStyle: Theme.of(context).textTheme.labelMedium!.apply(
            color: HkColors.black,
            fontWeightDelta: 2
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:poi_maps/screens/home/controller/home_controller.dart';
import 'package:poi_maps/screens/home/widgets/item_card.dart';

import '../../../utils/constants/sizes.dart';

class HkCardGridView extends StatelessWidget {
  const HkCardGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 80,
        mainAxisExtent: 98,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            /// Card
            HkItemCard(index:index),
            const SizedBox(height: 4,),

            /// Title
            Text(
              HomeController.instance.categoryTexts[index],
              style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 10,fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )

          ],
        );
      },
    );
  }
}


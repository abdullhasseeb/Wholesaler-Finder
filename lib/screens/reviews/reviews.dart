

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:poi_maps/common/widgets/appbar/appbar.dart';
import 'package:poi_maps/common/widgets/functional_rating.dart';
import 'package:poi_maps/screens/reviews/widgets/webview.dart';
import 'package:poi_maps/utils/constants/sizes.dart';

import '../../common/widgets/user_profile/profile_heading.dart';
import '../../utils/constants/colors.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HkAppBar(
        title: Text('Write a review',style: Theme.of(context).textTheme.bodyMedium,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// User Name, email and Profile Picture
              const HkProfileHeading(),
              const SizedBox(height: HkSizes.spaceBtwSections,),

              /// Rating Bar to choose Rating
              const Center(child: HkFunctionalRating()),
              const SizedBox(height: HkSizes.spaceBtwItems,),

              /// TextField For Input Review Text
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Share details of your own experience at this place',
                  hintStyle: TextStyle(color: HkColors.black.withOpacity(0.5))
                ),
              ),

              const SizedBox(height: HkSizes.spaceBtwSections,),
              Align(
                alignment: Alignment.bottomRight,
                  child: ElevatedButton(onPressed: () async{

                  }, child: const Text('Post')))
            ],
          ),
        ),
      )
    );
  }
}

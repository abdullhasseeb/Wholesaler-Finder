


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_maps/common/widgets/appbar/appbar.dart';
import 'package:poi_maps/screens/contribution/controller/contribution_controller.dart';
import 'package:poi_maps/screens/contribution/widgets/location_search_field.dart';
import 'package:poi_maps/screens/contribution/widgets/locations_list.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class ContributionScreen extends StatelessWidget {
  const ContributionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContributionController());
    return Scaffold(
      appBar: HkAppBar(
        title: Text('Contribution',style: Theme.of(context).textTheme.headlineMedium!.apply(color: HkColors.white),),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(HkSizes.defaultSpace),
        child: Column(
          children: [
            const Text('Note:- You can search wholesaler by its shop Name and Address'),
            const SizedBox(height: HkSizes.spaceBtwSections,),

            /// Location Search Text Field
            const HkLocationTextField(),

            Obx(
                () => controller.locationsList.value.isEmpty
                    ?
                    /// Search Results
                const Expanded(child: Center(child: Text('Search any wholesaler',style:
                TextStyle(fontSize: 20)),),)
                    :
                /// Locations List
                const LocationsList(),
            )
          ],
        ),

      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_maps/admin/screens/add_location/widgets/locations_list.dart';
import 'package:poi_maps/admin/screens/add_location/widgets/seatch_textfield.dart';
import 'package:poi_maps/utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'controller/add_location_controller.dart';

class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddLocationController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HkColors.primary,
        centerTitle: true,
        title: const Text('Search Wholesalers',style: TextStyle(color: HkColors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(HkSizes.defaultSpace),
        child: Column(
          children: [
            /// Search TextField
            const HkSearchTextField(),

            Obx(() =>
            controller.locationsList.value.isEmpty
                ?
            /// Search Text
            const Expanded(child: Center(child: Text('Search any wholesaler', style:
            TextStyle(fontSize: 20),)))
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

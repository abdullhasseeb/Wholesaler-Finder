

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_maps/navigation_menu.dart';
import 'package:poi_maps/screens/home/controller/home_controller.dart';
import 'package:poi_maps/screens/home/widgets/search_field/search_results_tile.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../map/controller/map_controller.dart';

class HkSearchResultsList extends StatelessWidget {
  const HkSearchResultsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mapController = Get.put(MapController());
    double totalHeight = 0;
    return Obx(() {
      if (HomeController.instance.filteredMarkersData.isEmpty) {

        return const SizedBox(height: 0); // Return an empty SizedBox if filteredMarkersData is empty

      } else {

        return SizedBox(
          height: (HomeController.instance.searchText.value == '') ? 0 : _calculateListViewHeight(totalHeight),
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: HkSizes.defaultSpace,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(HkSizes.inputFieldRadius),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 5,
                      color: HkColors.black.withOpacity(0.3)
                    )
                  ]
                ),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: HomeController.instance.filteredMarkersData.length,
                  itemBuilder: (context, index) {
                    return HkSearchResultsTile(
                      onTap: () async{

                        HomeController.instance.searchFocusNode.unfocus();

                        /// Move to maps screen
                        NavigationController.instance.selectedIndex.value = 1;

                        /// empty the searchText variable and search controller
                        HomeController.instance.searchText.value = '';
                        HomeController.instance.searchController.text = '';

                        /// Start Loading
                        mapController.mapLoading.value = true;

                        /// Extract marker's GeoPoint from the FireStore
                        GeoPoint geoPoint = HomeController.instance.filteredMarkersData.value[index].location;

                        /// animate to marker
                        await mapController.moveCameraToGivenPosition(geoPoint.latitude, geoPoint.longitude);



                        /// Stop Loading
                        mapController.mapLoading.value = false;

                      },
                      title: HomeController.instance.filteredMarkersData[index].title,
                      subTitle: HomeController.instance.filteredMarkersData[index].description.toString(),
                    );
                  },
                ),
              )),
        );
      }
    });
  }

  double _calculateListViewHeight(totalHeight) {
    // Calculate the height based on the number of items in the ListView
    double itemHeight = 80; // Height of each item in the ListView;
    int itemCount = HomeController.instance.filteredMarkersData.value.length;
    double separatorHeight = 1; // Height of the separator between items;
    totalHeight = itemHeight * itemCount + separatorHeight * (itemCount - 1);
    return totalHeight;
  }
}

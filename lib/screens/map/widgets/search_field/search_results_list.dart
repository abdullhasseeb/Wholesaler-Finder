import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:poi_maps/screens/map/controller/map_controller.dart';
import 'package:poi_maps/screens/map/widgets/search_field/search_results_tile.dart';
import '../../../../utils/constants/sizes.dart';

class HkSearchResultsList extends StatelessWidget {
  const HkSearchResultsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double totalHeight = 0;
    return Obx(() {
      if (MapController.instance.filteredMarkersData.isEmpty) {
        return const SizedBox(height: 0); // Return an empty SizedBox if filteredMarkersData is empty
      } else {
        return SizedBox(
          height: (MapController.instance.searchText.value == '') ? 0 : _calculateListViewHeight(totalHeight),
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: HkSizes.defaultSpace,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(HkSizes.inputFieldRadius)),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: MapController.instance.filteredMarkersData.length,
                  itemBuilder: (context, index) {
                    return HkSearchResultsTile(
                      onTap: () {
                        /// Start Loading
                        MapController.instance.mapLoading.value = true;

                        /// Extract marker's GeoPoint from the FireStore
                        GeoPoint geoPoint = MapController.instance.filteredMarkersData.value[index].location;

                        /// animate to marker
                        MapController.instance.moveCameraToGivenPosition(geoPoint.latitude, geoPoint.longitude);

                        /// empty the searchText variable and search controller
                        MapController.instance.searchText.value = '';
                        MapController.instance.searchController.text = '';

                        /// Stop Loading
                        MapController.instance.mapLoading.value = false;
                      },
                      title: MapController.instance.filteredMarkersData[index].title,
                      subTitle: MapController.instance.filteredMarkersData[index].description.toString(),
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
    double itemHeight = 75; // Height of each item in the ListView;
    int itemCount = MapController.instance.filteredMarkersData.value.length;
    double separatorHeight = 1; // Height of the separator between items;
    if(itemCount > 3){
      totalHeight = itemHeight * 3 + separatorHeight * (itemCount - 1);
    }else{
      totalHeight = itemHeight * itemCount + separatorHeight * (itemCount - 1);
    }


    return totalHeight;
  }
}

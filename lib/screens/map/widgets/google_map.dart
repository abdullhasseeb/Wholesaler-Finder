


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:poi_maps/screens/map/controller/map_controller.dart';
import 'package:poi_maps/screens/map/controller/marker_controller.dart';

class HkGoogleMap extends StatelessWidget {
  const HkGoogleMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MarkerController());
    return Obx(()=> GoogleMap(
      initialCameraPosition: MapController.instance.initialPosition ,
      onMapCreated: MapController.instance.onMapCreated,
      mapType: MapType.normal,
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      mapToolbarEnabled: false,
      myLocationButtonEnabled: false,
      markers: MapController.instance.markersPosition.value,
      compassEnabled: true,
      polylines: MapController.instance.polylines.value,
      onTap: (argument) async{
        /// Implement anything here if user tap on google map

        /// Hide the results box and empty search field
        MapController.instance.filteredMarkersData.value.clear();
        MapController.instance.searchText.value = '';
        MapController.instance.searchController.text = '';

        /// Clear the map controller

      },
    ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poi_maps/screens/map/controller/map_controller.dart';
import 'package:poi_maps/utils/constants/colors.dart';

class HkGPSButton extends StatelessWidget {
  const HkGPSButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());

    return Positioned(
      bottom: 16.0,
      right: 16.0,
      child: FloatingActionButton(
        onPressed: () async {
          /// Get the User current position
          Position? currentPosition = await controller.getCurrentLocation();
          /// move camera to current position
          await controller.moveCameraToGivenPosition(
              currentPosition!.latitude,
              currentPosition.longitude);
        } ,
        backgroundColor: Colors.white,
        child: const Icon(Icons.gps_fixed, color: HkColors.primary,),
      ),
    );
  }
}
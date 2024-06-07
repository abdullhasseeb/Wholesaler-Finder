








import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_maps/screens/map/widgets/circular_loading.dart';
import 'package:poi_maps/screens/map/widgets/google_map.dart';
import 'package:poi_maps/screens/map/widgets/gps_button.dart';
import 'package:poi_maps/screens/map/widgets/map_category_dropdown.dart';
import 'package:poi_maps/screens/map/widgets/search_field/search_field_and_results.dart';

import 'controller/map_controller.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());

    return const Scaffold(
      body: Stack(
        children: [
          /// Google Maps
          HkGoogleMap(),

          /// GPS Button For Current Location
          HkGPSButton(),

          /// Search TextField
          SearchFieldAndResults(),

          /// Circular Progress Indication
          CircularLoading(),

        ],
      ),
    );
  }
}









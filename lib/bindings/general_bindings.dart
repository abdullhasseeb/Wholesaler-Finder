

import 'package:get/get.dart';
import 'package:poi_maps/utils/helpers/network_manager.dart';

import '../screens/map/controller/map_controller.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(MapController());
  }

}
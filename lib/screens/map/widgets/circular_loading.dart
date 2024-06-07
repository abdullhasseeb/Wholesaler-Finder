import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_maps/screens/map/controller/map_controller.dart';

import '../../../utils/constants/colors.dart';





class CircularLoading extends StatelessWidget {
  const CircularLoading({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Obx(()=> MapController.instance.mapLoading.value
        ? const Center(child: CircularProgressIndicator(color: HkColors.primary,))
        : const SizedBox());
  }
}
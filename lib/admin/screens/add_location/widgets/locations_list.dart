

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../upload/controller/upload_controller.dart';
import '../../upload/upload.dart';
import '../controller/add_location_controller.dart';

class LocationsList extends StatelessWidget {
  const LocationsList({super.key});

  @override
  Widget build(BuildContext context) {
    final uploadController = Get.put(UploadController());
    return  Expanded(
      child: Obx(
            () => ListView.builder(
          itemCount: AddLocationController.instance.locationsList.length,
          itemBuilder:(context, index) {
            final location = AddLocationController.instance.locationsList.value[index];
            return ListTile(
              onTap: () {
                /// get place id and description from location and store in RX variable
                uploadController.selectedPlaceId.value = location.placeId.toString();
                uploadController.selectedDescription.value = location.description.toString();

                /// Navigate to upload screen
                Get.to(() => const UploadScreen());
              },
              title: Text(location.structuredFormatting!.mainText.toString()),
              subtitle: Text(location.description.toString()),

            );
          },),
      ),
    );
  }
}

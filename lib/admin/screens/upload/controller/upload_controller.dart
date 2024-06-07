

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poi_maps/admin/data/repositories/upload/upload_repository.dart';

import '../../../../utils/helpers/dialog_functions.dart';
import '../model/location_model.dart';

class UploadController extends GetxController{
  static UploadController get instance => Get.find();

  /// Variables
  RxString selectedCategory = 'Food'.obs;
  RxList<String> allCategories = ['Food', 'Electronics', 'Car Parts', 'Delivery', 'Home Supplies', 'Beauty', 'Cleaning',].obs;
  final nameController = TextEditingController();
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 00.0.obs;
  Rx<LocationModel> locationData = LocationModel().obs;
  RxString selectedPlaceId = ''.obs;
  RxString selectedDescription = ''.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  /// Firebase Variables
  final _db = FirebaseFirestore.instance.collection('p');


  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }


  @override
  void onClose() {
    nameController.text = '';
  }

  generateModel() async{

    /// Find Latitude And Longitude using Geocoding through using description
    List<Location> locations = await locationFromAddress(selectedDescription.value);

    latitude.value = locations.first.latitude;
    longitude.value  = locations.first.longitude;

    /// Create GeoPoint of the location/
    GeoPoint geoPoint = GeoPoint(latitude.value, longitude.value);

    /// Fill the location model
    locationData.value = LocationModel(
        title: nameController.value.text,
      category: selectedCategory.value,
      description: selectedDescription.value,
      location: geoPoint,
      placeId: selectedPlaceId.value,
    );

  }
  
  
  
  uploadData() async{

    try{
      /// if Validation is failed then return
      if(!formKey.currentState!.validate()){
        return;
      }

      /// Generate data and store into model
      await generateModel();

      /// Upload Data into FireStore
      await UploadRepository().uploadData();

      /// Show Success Message
      HkDialogFunctions.successSnackBar(title: 'Data Uploaded');

    }catch(e){
      HkDialogFunctions.errorSnackBar(title: 'Failed to upload', message: e);
    }finally{

    }

  }

}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:poi_maps/common/widgets/success_screen/success_screen.dart';
import 'package:poi_maps/navigation_menu.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/dialog_functions.dart';
import '../../map/models/marker_model.dart';
import '../../../data/repository/upload/upload_repository.dart';

class UploadController extends GetxController{
  static UploadController get instance => Get.find();

  /// Variables
  RxString selectedCategory = 'Food'.obs;
  RxList<String> allCategories = ['Food', 'Electronics', 'Car Parts', 'Delivery', 'Home Supplies', 'Beauty', 'Cleaning',].obs;
  final nameController = TextEditingController();
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 00.0.obs;
  Rx<MarkerModel> markerData = MarkerModel.empty().obs;
  RxString selectedPlaceId = ''.obs;
  RxString selectedDescription = ''.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool buttonLoading = false.obs;
  

  
  

  generateModel() async{

    /// Find Latitude And Longitude using Geocoding through using description
    List<Location> locations = await locationFromAddress(selectedDescription.value);

    latitude.value = locations.first.latitude;
    longitude.value  = locations.first.longitude;

    /// Create GeoPoint of the location/
    GeoPoint geoPoint = GeoPoint(latitude.value, longitude.value);

    /// Fill the location model
    markerData.value = MarkerModel(
        title: nameController.value.text,
      category: selectedCategory.value,
      description: selectedDescription.value,
      location: geoPoint,
      placeId: selectedPlaceId.value,
    );

  }
  
  
  
  uploadData() async{

    try{
      /// Start Loading
      buttonLoading.value = true;

      /// if Validation is failed then return
      if(!formKey.currentState!.validate()){
        return;
      }

      /// Generate data and store into model
      /// OR Add data into Model
      await generateModel();

      /// Upload Data into FireStore
      await UploadRepository().uploadContributedMarker();

      
      /// Show Success Message
      Get.offAll(() => SuccessScreen(
          image: HkImages.staticSuccessIllustration,
          title: HkTexts.contributeSuccessTitle,
          subtitle: HkTexts.contributeSuccessSubTitle,
          onPress: () => Get.offAll(()=> const NavigationMenu())
      ));

    }catch(e){
      HkDialogFunctions.errorSnackBar(title: 'Failed to upload', message: e);
    }finally{
      buttonLoading.value = false;
    }

  }

}
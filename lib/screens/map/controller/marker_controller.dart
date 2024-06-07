

import 'dart:typed_data';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:poi_maps/data/repository/maps/maps_repository.dart';
import 'package:poi_maps/data/repository/marker/marker_repository.dart';
import 'package:poi_maps/screens/map/controller/map_controller.dart';
import 'package:poi_maps/screens/map/models/directions_model.dart';
import 'package:poi_maps/utils/exceptions/google_maps_direction_exceptions.dart';
import 'package:poi_maps/utils/helpers/dialog_functions.dart';
import 'package:poi_maps/utils/helpers/helper_functions.dart';

import '../models/marker_details_model.dart';
import 'package:get/get.dart';
class MarkerController extends GetxController{
  static MarkerController get instance => Get.find();


  /// Marker Details Variables
  RxString name = ''.obs;
  RxString imageUrl = ''.obs;
  RxDouble rating = 0.0.obs;
  Rx<Uint8List?> imageData = Rx<Uint8List?>(null);
  RxString photoReference = ''.obs;
  Rx<MarkerDetailsModel> markerDetails =  MarkerDetailsModel().obs;
  Rx<LatLng> latLng = LatLng(-33,122).obs;
  Rx<Directions> directions = Directions().obs;
  RxString markerPlaceId = ''.obs;


  /// BottomSheet Variables
  RxBool bottomSheetExpand = false.obs;
  RxBool detailsLoading = false.obs;


  /// Reviews Variables
  RxList<Reviews> reviewsList = <Reviews>[].obs;
  RxBool reviewsLoading = false.obs;
  RxBool viewAllReviews = false.obs;
  

  void onMarkerTapped(String placeId) async{
    markerPlaceId.value = placeId;
    try{
      ///Start Loading of Details
      detailsLoading.value = true;
      reviewsLoading.value = true;

      /// Reset All Variables
      name.value = '';
      photoReference.value = '';
      rating.value = 0.0;
      reviewsList.value = [];

      await HkDialogFunctions.openBottomSheet();

      /// Get All The details of the marker
      await getMarkerDetails(placeId);

      /// Stop Loading of Details
      detailsLoading.value = false;

      /// get list of reviews of a single marker
      await getMarkerReviewsList();

      /// Stop Loading of Reviews
      reviewsLoading.value = false;

    } catch(e){
      /// Show Error Message to user
      HkDialogFunctions.errorSnackBar(title: 'Oh Snap',message: e.toString());

    }finally {
      detailsLoading.value = false;
      reviewsLoading.value = false;
    }
  }

  /// get the Details of the marker and store in Rx variables
  getMarkerDetails(String placeId) async{
   try{
     /// Fetch Marker Details
     markerDetails.value = await MarkerRepository().fetchMarkerDetails(placeId);

     /// Fill the Variables of Marker Details to show
     /// Name Variable
     name.value = markerDetails.value.name.toString();


     /// if there is no photo of shop then it will be null so I handle it
     /// Rating Variable
     if(markerDetails.value.rating != null && !markerDetails.value.rating!.isNaN) {

       rating.value = markerDetails.value.rating!.toDouble();
     }

     /// if there is no photo of shop then it will be null so I handle it
     /// photoReference Variable
     if(markerDetails.value.photos != null && markerDetails.value.photos!.isNotEmpty){



       photoReference.value = markerDetails.value.photos![0].photoReference ?? '';

       /// Fetch 1 Image from the marker to show
       Uint8List? image = await MarkerRepository().fetchImage(photoReference.value);

       imageData.value = image!;

     }else{

       imageData.value = null;
     }
   }catch(e){
     rethrow;
   }
  }

  /// get reviews of the markers
  getMarkerReviewsList()async{

    if(markerDetails.value.reviews != null
        && markerDetails.value.reviews!.isNotEmpty
        && markerDetails.value.reviews!.length.isGreaterThan(0)){

      reviewsList.value = markerDetails.value.reviews!.toList();
    }


  }

  /// Create Directions using API
  void getDirections() async{
    try{

      /// get User Current location
      Position? currentPosition = await MapController.instance.getCurrentLocation();

      /// if current location is null then generate current location of the user
      if(currentPosition.toString() == ''){
        MapController.instance.getCurrentLocation();
      }

      /// Change Position to LatLng
      LatLng origin = LatLng(currentPosition!.latitude, currentPosition.longitude);

      /// Generate Directions and store in RX Variable
      directions.value = (await MapRepository().getDirections(
          origin: origin,
          destination: latLng.value))!;

      /// Close the Bottom Sheet
      Get.back();

      /// show polylines in t he map
      MapController.instance.loadPolylines();

      /// Move the Camera to the user current position
      MapController.instance.moveCameraToGivenPosition(currentPosition.latitude, currentPosition.longitude);

    }
    catch(e){
      HkDialogFunctions.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}


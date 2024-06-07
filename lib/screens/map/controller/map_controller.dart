


import 'dart:async';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:poi_maps/data/repository/maps/maps_repository.dart';
import 'package:poi_maps/screens/home/controller/home_controller.dart';
import 'package:poi_maps/screens/map/controller/marker_controller.dart';
import 'package:poi_maps/utils/constants/images.dart';
import 'package:poi_maps/utils/constants/sizes.dart';
import 'package:poi_maps/utils/constants/text_strings.dart';
import 'package:poi_maps/utils/helpers/network_manager.dart';

import '../../../utils/helpers/dialog_functions.dart';
import '../models/marker_model.dart';

class MapController extends GetxController{
  static MapController get instance => Get.find();


  /// Variables
  RxBool mapLoading = false.obs;
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();
  RxString searchText = ''.obs;
  Completer<GoogleMapController> mapController = Completer();
  bool isMapControllerComplete = false;
  CameraPosition initialPosition = const CameraPosition(target: LatLng(-37.837988, 144.7399269),zoom: 9);
  RxList<MarkerModel> markersData = <MarkerModel>[].obs;
  RxList<MarkerModel> filteredMarkersData = <MarkerModel>[].obs;
  RxSet<Marker> markersPosition = <Marker>{}.obs;
  RxSet<Marker> filteredMarkersPosition = <Marker>{}.obs;
  RxSet<Polyline> polylines = <Polyline>{}.obs;

  /// DropDown Variables
  RxList<String> allCategories = ['Food', 'Electronics', 'Car Parts', 'Delivery', 'Home Supplies', 'Beauty', 'Cleaning',].obs;
  RxString selectedCategory = ''.obs;

  @override
  void onInit() {
    super.onInit();

      /// Load All The markers from FireStore Database when map screen launch
    onMapLaunch();
    Get.put(MarkerController());
  }


  @override
  void dispose() {
    super.dispose();
    searchText.value = '';
    searchController.dispose();
    filteredMarkersData.clear();
  }

  /// Whenever user navigate to Maps screen
  Future<void> onMapLaunch() async{
    try{
      /// Check Internet Connection
      bool isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) return;

      /// Check Location Permission
      PermissionStatus status = await Permission.location.request();

      if(status == PermissionStatus.denied){
        HkDialogFunctions.showAlert(HkTexts.locationDeniedTitle, HkTexts.locationDeniedMessage);
        return;
      } else if(status == PermissionStatus.permanentlyDenied){
        await AppSettings.openAppSettings();
        return;
      }

      /// Start Loading
      mapLoading.value = true;

      /// fetch markers from FireStore to List<MarkerModel>
      await MapRepository().fetchMapMarkers().then((value) {

        markersData.value.addAll(value);
        HomeController.instance.markersData.value.addAll(markersData);

      }).onError((error, stackTrace) {
        print('on error');
      });

      /// Load all the markers in Variable
      loadMarkers();

    }catch(e){
      HkDialogFunctions.errorSnackBar(title: 'Something went wrong', message: e);
    }finally{
      /// Stop Loading
      mapLoading.value = false;
    }
  }


  /// Load Markers as a Set<Marker> from MarkerModel
   loadMarkers() async{

    /// Convert Assets Icon to Bitmap Descriptor for Marker Icon
    BitmapDescriptor markerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(100, 100)), HkImages.wholesalerIcon);

      markersPosition.addAll(markersData.value.map((marker) {
        // get Latitude and Longitude
        LatLng latLng = LatLng(marker.location.latitude, marker.location.longitude);

        return Marker(
          markerId: MarkerId(latLng.toString(),),
          position: latLng,
          infoWindow: InfoWindow(title: marker.title),
          onTap: () async{
            MarkerController.instance.onMarkerTapped(marker.placeId);
            MarkerController.instance.latLng.value = latLng;
          } ,
          icon: markerIcon,
        );
      } ));


  }

  void markersFilterBasedOnCategory(String filter) async{
    if(selectedCategory.value != ''){

      /// Convert Assets Icon to Bitmap Descriptor for Marker Icon
      BitmapDescriptor markerIcon = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size(100, 100)), HkImages.wholesalerIcon);

      filteredMarkersData.value = markersData.value.where((element) {

        return element.category.toLowerCase()
            .contains(selectedCategory.value.toLowerCase());
      }).toList();
    }else{

      filteredMarkersData.clear();
    }
  }


  void loadPolylines() {
    final controller = Get.put(MarkerController());
        polylines.add(
            Polyline(
                polylineId: const PolylineId('Id'),
                color: Colors.red,
                width: 5,
                points: controller.directions.value.polylinePoints!
                    .map((e) => LatLng(e.latitude, e.longitude))
                    .toList()
        )
        );
  }


  /// First Time Map Created and assign controller
  void onMapCreated(GoogleMapController controller) {
    try{
      /// without this condition mapController complete multiple time and error occurs
      if(!isMapControllerComplete){
        mapController.complete(controller);
        isMapControllerComplete = true;
      }
    }catch(e){
     rethrow;
    }


  }


  /// Fetch user current location
  Future<Position?> getCurrentLocation()async{
    Position? currentPosition;
    try{
      /// Start Loading
      mapLoading.value = true;

      /// Permission for Location GPS
      LocationPermission locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied) {}


      currentPosition = await MapRepository().fetchCurrentPosition();

      return currentPosition;
    }catch(e){
      HkDialogFunctions.showAlert(HkTexts.locationDeniedTitle, e.toString());
    }finally{
      mapLoading.value = false;
    }
    return currentPosition!;


  }


  /// Animate the google camera to any location
  Future<void> moveCameraToGivenPosition(double latitude, double longitude)async{

    try{
      /// Start Loading
      mapLoading.value = true;

      /// Set Camera Position
      CameraPosition cameraPosition = CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: HkSizes.zoom);

        /// Create controller for animate
        GoogleMapController controller = await mapController.future;

        /// Animate to Camera Position
      await controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    }catch(e){
      throw e;
    }finally{
      mapLoading.value = false;
    }
  }


  /// Filter the data when search and store in FilteredMarkedData Variable
  void getFilteredMarker() async{

    if(searchText.value != ''){

      filteredMarkersData.value =  markersData.value.where(
              (element) {
                return element.title.toLowerCase().contains(
                    searchText.toLowerCase());
              }).toList();

    }else{
      filteredMarkersData.clear();
    }
  }




}



import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:poi_maps/screens/map/controller/map_controller.dart';
import 'package:poi_maps/screens/map/controller/marker_controller.dart';

class ReviewsController extends GetxController{
  static ReviewsController get instance => Get.find();


  /// Variables
  final reviewTextController = TextEditingController();
  final rating = TextEditingController();
  RxDouble currentRating = 0.0.obs;
  Rx<MarkerController> markerController = MarkerController.instance.obs;

  //final placeId = MapController.instance.markersData[0].placeId;
  final placeId = MarkerController.instance.markerPlaceId.value;
  final String apiKey = 'AIzaSyDHoFrJ1Gh3E4bOjZ9Jhh0SlxoK68K1b_4'; // Replace with your actual API key
}
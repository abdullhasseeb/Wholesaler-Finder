

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:uuid/uuid.dart';

import '../../../../utils/constants/urls.dart';
import '../model/locations_model.dart';

class AddLocationController extends GetxController{
  static AddLocationController get instance => Get.find();

  /// Variables
  final searchController = TextEditingController().obs;
  Rx<Uuid> uuid = const Uuid().obs;
  RxString sessionToken = '123'.obs;
  RxList<LocationsModel> locationsList = <LocationsModel>[].obs;


  void getLocations(String text) async{
    try{
      /// if session token is empty then fill it
      if(sessionToken.value.isEmpty){
        sessionToken.value = uuid.value.v4();
      }

      /// send request to get response
      String suggestionUrl = HkUrls.getSuggestionUrl(text, sessionToken.value);
      var response = await get(Uri.parse(suggestionUrl));

      if(response.statusCode == 200){
        List<dynamic> data = jsonDecode(response.body) ['predictions'];
        locationsList.value = data.map((location) => LocationsModel.fromJson(location)).toList();
      }


    } on HttpException catch (e){
      throw HttpException('Locations Error : ${e.message}');
    } catch (e){
      rethrow;
    }

  }


}
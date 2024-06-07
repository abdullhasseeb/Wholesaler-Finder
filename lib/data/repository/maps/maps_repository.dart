
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:poi_maps/utils/exceptions/dio_exceptions.dart';
import 'package:poi_maps/utils/exceptions/http_exceptions.dart';
import 'package:poi_maps/utils/exceptions/location_sxceptions.dart';
import 'package:poi_maps/utils/exceptions/socket_exceptions.dart';
import 'package:poi_maps/utils/exceptions/timeout_exceptions.dart';
import '../../../screens/map/models/directions_model.dart';
import '../../../screens/map/models/marker_model.dart';
import '../../../utils/constants/urls.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/google_maps_direction_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/helpers/dialog_functions.dart';

class MapRepository extends GetxController {
  static MapRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final _dio = Dio();

  /// fetch map markers from fireStore
  Future<List<MarkerModel>> fetchMapMarkers() async {
    try {
      final allDocuments = await _db.collection('locations').get();
      return allDocuments.docs.map((e) => MarkerModel.fromFirestore(e)).toList();

    } on FirebaseException catch (e) {
      throw HkFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw const HkFormatException();
    } on PlatformException catch (e) {
      throw HkPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Fetch The current position of the user
  Future<Position> fetchCurrentPosition() async{
    try{

      /// Get Current Position of user
      return await Geolocator.getCurrentPosition();

    } on HkLocationExceptions catch (e){
      throw HkLocationExceptions(e.code);
    } on PlatformException catch (e){
      throw HkLocationExceptions(e.code);
    } on Exception catch(e){
      throw Exception(e);
    }
    catch (e){
      throw 'Something went wrong. Please try again';
    }
}



  Future<Directions?> getDirections({required LatLng origin, required LatLng destination,}) async {
    try{
      final response = await _dio.get(
        HkUrls.directionsApi,
        queryParameters: {
          'origin': '${origin.latitude},${origin.longitude}',
          'destination': '${destination.latitude},${destination.longitude}',
          'key': "AIzaSyDHoFrJ1Gh3E4bOjZ9Jhh0SlxoK68K1b_4",
        },
      );

      // Check if response is successful
      if (response.statusCode == 200) {

        if(response.data['status'].toString() == 'ZERO_RESULTS'){
          throw "Can't seem to find a way";
        }else{
          return Directions.fromMap(response.data);
        }
      }else{
        throw HkHttpException.fromStatusCode(response.statusCode!);
      }
    } on DioException catch(e){
      throw HkDioException.fromDioError(e);
    } on TimeoutException catch(e){
      throw HkTimeoutException.fromCase(e.message!);
    } on HkHttpException catch(e){
      throw HkHttpException.fromMessage(e.message);
    } on SocketException catch(e){
      throw HkSocketException.fromOsError(e.osError!);
    } on HkGoogleMapsDirectionException catch(e){
      throw HkGoogleMapsDirectionException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }

  }



}
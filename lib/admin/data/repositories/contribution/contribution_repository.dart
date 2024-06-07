



import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:poi_maps/admin/screens/contribution/controller/contribution_controller.dart';

import '../../../../screens/map/models/marker_model.dart';
import '../../../../utils/exceptions/firebase_exceptions.dart';
import '../../../../utils/exceptions/format_exceptions.dart';
import '../../../../utils/exceptions/http_exceptions.dart';
import '../../../../utils/exceptions/platform_exceptions.dart';
import '../../../../utils/exceptions/socket_exceptions.dart';
import '../../../../utils/exceptions/timeout_exceptions.dart';

class ContributionRepository extends GetxController{
  static ContributionRepository get instance => Get.find();

  /// variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;


  /// fetch map markers from [contributions] collection
  Future<List<MarkerModel>> fetchMapContributions() async {
    try {

      final allDocuments = await _db.collection('contributions').get();
      return allDocuments.docs.map((e) => MarkerModel.fromFirestore(e)).toList();

    } on FirebaseException catch (e) {
      throw HkFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw const HkFormatException();
    } on PlatformException catch (e) {
      throw HkPlatformException(e.code).message;
    }on TimeoutException catch(e){
      throw HkTimeoutException.fromCase(e.message!);
    } on HkHttpException catch(e){
      throw HkHttpException.fromMessage(e.message);
    } on SocketException catch(e){
      throw HkSocketException.fromOsError(e.osError!);
    }  catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Marker to actual [locations] collection
  Future<void> uploadToActualMarkers(int index) async {
    try {

      await _db.collection('locations')
          .add(ContributionController.instance
          .contributionsList.value[index].toJson());

    } on FirebaseException catch (e) {
      throw HkFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw HkFormatException(e.toString());
    } on PlatformException catch (e) {
      throw HkPlatformException(e.code).message;
    } on TimeoutException catch(e) {
      throw HkTimeoutException.fromCase(e.message!);
    } on HttpException catch(e){
      throw HkHttpException.fromMessage(e.message);
    } on SocketException catch(e){
      throw HkSocketException.fromOsError(e.osError!);
    } catch(e){
      rethrow;
    }
  }

  /// Delete Marker from [contributions] collection
  Future<void> deleteFromContribution(String documentId) async {
    try {

      await _db.collection('contributions').doc(documentId).delete();

    } on FirebaseException catch (e) {
      throw HkFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw HkFormatException(e.toString());
    } on PlatformException catch (e) {
      throw HkPlatformException(e.code).message;
    } on TimeoutException catch(e) {
      throw HkTimeoutException.fromCase(e.message!);
    } on HttpException catch(e){
      throw HkHttpException.fromMessage(e.message);
    } on SocketException catch(e){
      throw HkSocketException.fromOsError(e.osError!);
    } catch(e){
      rethrow;
    }
  }




}
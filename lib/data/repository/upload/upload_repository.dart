


import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../screens/upload/controller/upload_controller.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/http_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/exceptions/socket_exceptions.dart';
import '../../../utils/exceptions/timeout_exceptions.dart';


class UploadRepository extends GetxController{
  static UploadRepository get instance => Get.find();


  final _db = FirebaseFirestore.instance.collection('contributions');

  Future<void> uploadContributedMarker() async {
    try {

      DocumentReference docRef = await _db.add(UploadController.instance.markerData.toJson());
      await docRef.update({'id': docRef.id});

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
      throw 'Something went wrong. Please try again';
    }
  }
}
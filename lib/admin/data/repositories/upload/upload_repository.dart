


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../utils/exceptions/firebase_exceptions.dart';
import '../../../../utils/exceptions/format_exceptions.dart';
import '../../../../utils/exceptions/platform_exceptions.dart';
import '../../../screens/upload/controller/upload_controller.dart';

class UploadRepository extends GetxController{
  static UploadRepository get instance => Get.find();


  final _db = FirebaseFirestore.instance.collection('locations');

  Future<void> uploadData() async {

    try {
      await _db.add(UploadController.instance.locationData.toJson());

    } on FirebaseException catch (e) {
      throw HkFirebaseException(e.code).message.toString();
    } on FormatException catch (e) {
      throw HkFormatException(e.toString()).message.toString();
    } on PlatformException catch (e) {
      throw HkPlatformException(e.code).message.toString();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
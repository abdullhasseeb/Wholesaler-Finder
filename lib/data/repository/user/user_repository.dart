
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poi_maps/data/repository/authentication/authentication_repository.dart';
import 'package:poi_maps/utils/exceptions/format_exceptions.dart';

import '../../../screens/authentication/model/user_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';


class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;


  /// Function to save user data to FireStore
  Future<void> saveUserRecord(UserModel user) async{
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch(e){
      throw HkFirebaseException(e.code).message;
    } on FormatException catch(e){
      throw const HkFormatException();
    } on PlatformException catch(e){
      throw HkPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async{
    try{
      final documentSnapshot = await _db.collection('Users').doc(AuthenticationRepository.instance.authUser!.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }else{
        return UserModel.empty();
      }
    } on FirebaseException catch(e){
      throw HkFirebaseException(e.code).message;
    } on FormatException catch(e){
      throw const HkFormatException();
    } on PlatformException catch(e){
      throw HkPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to update user data in FireStore
  Future<void> updateUserDetails(UserModel updatedUser) async{
    try{
      await _db.collection('Users').doc(updatedUser.id).update(updatedUser.toJson());
    } on FirebaseException catch(e){
      throw HkFirebaseException(e.code).message;
    } on FormatException catch(e){
      throw const HkFormatException();
    } on PlatformException catch(e){
      throw HkPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Update any single field in specific user collection
  Future<void> updateSingleField(Map<String, dynamic> json) async{
    try{
      await _db.collection('Users').doc(AuthenticationRepository.instance.authUser!.uid).update(json);
    } on FirebaseException catch(e){
      throw HkFirebaseException(e.code).message;
    } on FormatException catch(e){
      throw const HkFormatException();
    } on PlatformException catch(e){
      throw HkPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to remove user data from FireStore
  Future<void> removeUserRecord(String userId) async{
    try{
      await _db.collection('Users').doc(userId).delete();
    } on FirebaseException catch(e){
      throw HkFirebaseException(e.code).message;
    } on FormatException catch(e){
      throw const HkFormatException();
    } on PlatformException catch(e){
      throw HkPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Any Image
  Future<String> uploadImage(String path, XFile image) async{
    try{
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      String url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch(e){
      throw HkFirebaseException(e.code).message;
    } on FormatException catch(e){
      throw const HkFormatException();
    } on PlatformException catch(e){
      throw HkPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
}
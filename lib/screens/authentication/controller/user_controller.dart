


import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poi_maps/data/repository/user/user_repository.dart';
import 'package:poi_maps/utils/helpers/helper_functions.dart';
import '../../../utils/helpers/dialog_functions.dart';
import '../model/user_model.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  final imageUploading = false.obs;
  final Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch User Record
  Future<void> fetchUserRecord() async{
    try{
      // start loading
      profileLoading.value = true;
      final user = await UserRepository.instance.fetchUserDetails();
      this.user(user);
    }catch(e){
      user(UserModel.empty());
    }finally{
      // stop loading
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async{
    try{

      // First update Rx user and then check if user data is already stored. if not then store new data
      await fetchUserRecord();

      if(user.value.id.isEmpty){
        if(userCredential != null){
          // Convert Name to  First and Last name
          final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(userCredential.user!.displayName ?? '');

          // Map The data in UserModel
          final user = UserModel(
              id: userCredential.user!.uid,
              firstName: nameParts[0],
              lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              username: username,
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePicture: userCredential.user!.photoURL ?? ''
          );

          // Save User data
          await userRepository.saveUserRecord(user);
        }
      }

    }catch (e){
      HkDialogFunctions.warningSnackBar(
          title: 'Data not saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your Profile'
      );
    }
  }

  /// Upload Profile Picture
  uploadUserProfilePicture() async{
   try{
     final image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70,maxHeight: 512, maxWidth: 512);
     if(image != null){

       // start loading
       imageUploading.value = true;

       //Upload Image
       final imageUrl = await userRepository.uploadImage('Users/Images/',image);

       // Update user image record
       Map<String, dynamic> json = {'ProfilePicture' : imageUrl};
       await userRepository.updateSingleField(json);

       // update Rx user
       user.value.profilePicture = imageUrl;
       user.refresh();
       
       // success message
       HkDialogFunctions.successSnackBar(title: 'Congratulations', message: 'Your Profile Image has been updated!');
    }
  }catch(e){
     HkDialogFunctions.errorSnackBar(title: 'Oh Snap', message: 'Something went wrong : $e');
   } finally{
     imageUploading.value = false;
   }
  }

}
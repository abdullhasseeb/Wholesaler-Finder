


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_maps/admin/screens/home/home.dart';
import 'package:poi_maps/data/repository/authentication/authentication_repository.dart';
import 'package:poi_maps/navigation_menu.dart';
import 'package:poi_maps/screens/authentication/controller/user_controller.dart';
import 'package:poi_maps/utils/helpers/helper_functions.dart';
import 'package:poi_maps/utils/helpers/network_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/helpers/dialog_functions.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();

  /// Variables
  final buttonLoading = false.obs;
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final profileController = Get.put(UserController());

 /// whenever this login controller called then email and password will be filled if Remember Me checked last time
  @override
  void onInit() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    email.text = localStorage.getString('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.getString('REMEMBER_ME_PASSWORD') ?? '';

    super.onInit();
  }

  /// Email and password sing-in
  Future<void> emailAndPasswordSignIn() async{
    try{
      // start loading
      buttonLoading.value = true;

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) return;

      // Form Validation
      if(!loginFormKey.currentState!.validate()) return;

      // Save Data if Remember Me is selected
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      if(rememberMe.value){
        localStorage.setString('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.setString('REMEMBER_ME_PASSWORD', password.text.trim());
      } else{
        localStorage.setString('REMEMBER_ME_EMAIL', '');
        localStorage.setString('REMEMBER_ME_PASSWORD','');
      }

      // login user using email & password authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // if check whether its admin or normal user
      if(email.text.startsWith('admin')){

        // set true when admin is logged in
        localStorage.setBool('admin', true);

        // Redirect to Home Screen which is Admin panel's screen
        Get.offAll(() => const HomeScreen());

      }else{
        // Redirect to Navigation Screen
        Get.offAll(() => const NavigationMenu());
      }


    }catch(e){
      HkDialogFunctions.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }finally{
      // stop loading
      buttonLoading.value = false;
    }
  }

  /// Google Sign-in Authentication
  Future<void> googleSignIn() async{
    try{
      // start loading
      buttonLoading.value = true;

      // check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) return;

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // save user record
      await profileController.saveUserRecord(userCredentials);

      // Redirect
      Get.offAll(() => const NavigationMenu());

    }catch(e){
      HkDialogFunctions.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }finally{
      buttonLoading.value = false;
    }
  }
}
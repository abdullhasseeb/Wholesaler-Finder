

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:poi_maps/admin/screens/home/home.dart';
import 'package:poi_maps/navigation_menu.dart';
import 'package:poi_maps/screens/authentication/login/login.dart';
import 'package:poi_maps/screens/authentication/profile/profile.dart';
import 'package:poi_maps/screens/onboarding/onboarding.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:poi_maps/screens/settings/settings.dart';
import 'package:poi_maps/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:poi_maps/utils/exceptions/firebase_exceptions.dart';
import 'package:poi_maps/utils/exceptions/format_exceptions.dart';
import 'package:poi_maps/utils/exceptions/platform_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository extends GetxController{

  static AuthenticationRepository get instance => Get.find();


  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  /// Called from main.dart when app launch
  @override
  void onReady() {
    // delay of 1 second for splash screen

    Timer(const Duration(seconds: 1,),() {},);
    screenRedirect();
    FlutterNativeSplash.remove();

  }

  /// Function to show relevant screen
  Future<void> screenRedirect() async{
    // Local Storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final user = _auth.currentUser;

    if(user != null){
      // check admin user or normal user was logged in
      if(prefs.get('admin') == true){
        Get.offAll(() => const HomeScreen());
      }else{
        Get.offAll(() => const NavigationMenu());
      }

    }else{

      // Store true if IsFirstTime Variable not exist
      if(prefs.getBool('IsFirstTime') == null){
        await prefs.setBool('IsFirstTime', true);
      }

      prefs.getBool('IsFirstTime') != true ? Get.offAll(()=> const LoginScreen()) : Get.offAll(()=> const OnBoardingScreen());
    }
  }


  /*---------------------- Email & Password Sign-in --------------------------------*/

  /// [EmailAuthentication] - Sign In
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      throw HkFirebaseAuthException(e.code).message;
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

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password)async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      throw HkFirebaseAuthException(e.code).message;
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


  /// [Re-Authenticate] - ReAuthenticate User

  /// [Email Verification] - Mail Verification


  /// [Email Verification] - Forget Password


  /*---------- Federated identity & social Sign-in --------------------------------*/

  /// [Google Authentication] - GOOGLE
  Future<UserCredential> signInWithGoogle()async{
    try{
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details form the request
      final GoogleSignInAuthentication googleAuth = await userAccount!.authentication;

      // Create a new Credential
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken,idToken: googleAuth.idToken);

      //Once signed in, return the user credential
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch(e){
      throw HkFirebaseAuthException(e.code).message;
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


  /// [Facebook Authentication] - FACEBOOK


  /*---------- ./end Federated identity & social Sign-in --------------------------------*/

  /// [Logout User] - Valid for any authentication
  Future<void> logout()async{
    try{
      // if there is google logged in then sign out from google
      await GoogleSignIn().signOut();

      // sign out from Firebase
      await _auth.signOut();

      // set admin false
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('admin', false);

      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch(e){
      throw HkFirebaseAuthException(e.code).message;
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
  /// DELETE USER - Remove user Auth and  Firestore Account

}
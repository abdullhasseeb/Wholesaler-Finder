
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:poi_maps/common/widgets/success_screen/success_screen.dart';
import 'package:poi_maps/screens/authentication/model/user_model.dart';
import 'package:poi_maps/screens/authentication/signup/verify_email.dart';
import 'package:poi_maps/utils/constants/images.dart';
import 'package:poi_maps/utils/helpers/helper_functions.dart';
import 'package:poi_maps/utils/helpers/network_manager.dart';

import '../../../../data/repository/authentication/authentication_repository.dart';
import '../../../../data/repository/user/user_repository.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/dialog_functions.dart';
import '../../login/login.dart';

class SignUpController extends GetxController{

  static SignUpController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final buttonLoading = false.obs;
  final firstName = TextEditingController(); // controller for first name input
  final lastName = TextEditingController(); // controller for last name input
  final username = TextEditingController(); // controller for username input
  final email = TextEditingController(); // controller for email input
  final phoneNumber = TextEditingController(); // controller for phone number input
  final password = TextEditingController(); // controller for password input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for form validation

  /// SIGNUP
  Future<void> signup() async{
    try{
      // Start Loading
      buttonLoading.value = true;
      //HkFullScreenLoader.openLoadingDialog('We are processing your information', HkImages.deliveredEmailIllustration);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) return;

      // Form Validation
      if(!signupFormKey.currentState!.validate()) return;

      // Privacy Policy Check
      if(!privacyPolicy.value) {
        HkDialogFunctions.warningSnackBar(title: 'Accept Privacy Policy',
            message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of use');
        return;
      }

      // Register user in the Firebase Authentication & Save the user data in the Firebase
      final userCredentials = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authenticated user data  in the Firebase FireStore
      final newUser = UserModel(
          id: userCredentials.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: ''
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Show Success Message
      HkDialogFunctions.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue');

      // Move to verify Email
      Get.to(() => SuccessScreen(
          image: HkImages.staticSuccessIllustration,
          title: HkTexts.yourAccountCreatedTitle,
          subtitle: HkTexts.yourAccountCreatedSubTitle,
          onPress: () => Get.offAll(()=> const LoginScreen())
      ));
    
    }catch(e){
      // Show some generic error to the user
      HkDialogFunctions.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally{
      // Remove Loader
      buttonLoading.value = false;
      //HkFullScreenLoader.stopLoading();
    }
  }
}
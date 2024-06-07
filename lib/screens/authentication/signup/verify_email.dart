


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../common/widgets/success_screen/success_screen.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../login/login.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(()=> const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(image: const AssetImage(HkImages.deliveredEmailIllustration),
              width: HkHelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: HkSizes.spaceBtwSections,),

              /// Title % Subtitle
              Text(HkTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: HkSizes.spaceBtwItems,),
              Text('support@unknownpro.com',style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
              const SizedBox(height: HkSizes.spaceBtwItems,),
              Text(HkTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: HkSizes.spaceBtwSections,),

              /// Buttons
              SizedBox(width: double.infinity,
                  child: ElevatedButton(
                    onPressed: ()=> Get.to(()=> SuccessScreen(
                      image: HkImages.staticSuccessIllustration,
                      title: HkTexts.yourAccountCreatedTitle,
                      subtitle: HkTexts.yourAccountCreatedSubTitle,
                      onPress: () => Get.to(()=> const LoginScreen()),)),
                    child: const Text("Continue"),),),
              SizedBox(width: double.infinity,
                child: TextButton(onPressed: (){},child: const Text(HkTexts.resendEmail),),)

            ],
          ),
        ),
      ),
    );
  }
}

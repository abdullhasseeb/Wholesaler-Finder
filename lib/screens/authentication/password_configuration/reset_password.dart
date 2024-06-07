


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../utils/constants/images.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(image: const AssetImage(HkImages.deliveredEmailIllustration),
                width: MediaQuery.of(context).size.width * 0.6,),
              const SizedBox(height: HkSizes.spaceBtwSections,),

              /// Title % Subtitle
              Text(HkTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: HkSizes.spaceBtwItems,),
              Text(HkTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: HkSizes.spaceBtwSections,),

              /// Buttons
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){},
                child: const Text("Done"),),),
              const SizedBox(height: HkSizes.spaceBtwItems,),
              SizedBox(width: double.infinity,child: TextButton(onPressed: (){},
                child: const Text(HkTexts.resendEmail),),),
            ],
          ),
        ),
      ),
    );
  }
}

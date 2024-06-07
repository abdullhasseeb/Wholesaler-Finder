


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:poi_maps/screens/authentication/password_configuration/reset_password.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Heading
              Text(HkTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: HkSizes.spaceBtwItems,),
              Text(HkTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium,),
              const SizedBox(height: HkSizes.spaceBtwSections * 2,),

              /// Text Field
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Email", prefixIcon: Icon(Iconsax.direct_right)),),
              const SizedBox(height: HkSizes.spaceBtwSections,),

              /// Submit Button
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=> Get.off(()=> const ResetPassScreen()),
              child: const Text("Submit"),),)

            ],
          ),
        ),
      ),
    );
  }
}

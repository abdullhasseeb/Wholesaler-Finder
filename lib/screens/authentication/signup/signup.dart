
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_maps/screens/authentication/signup/widgets/signup_form.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../common/widgets/login_signup/form_divider.dart';
import '../../../common/widgets/login_signup/social_buttons.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
              /// Title
              Text(HkTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: HkSizes.spaceBtwSections,),

              /// Form
              const HkSignUpForm(),

              /// Divider
              HkFormDivider(dividerText: HkTexts.orSignUpWith.capitalize!),
              const SizedBox(height: HkSizes.spaceBtwSections,),

              /// Social Buttons
              const HkSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_maps/screens/authentication/login/widgets/login_form.dart';
import 'package:poi_maps/screens/authentication/login/widgets/login_header.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: HkSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Logo , Title And Subtitle
              const HkLoginHeader(),

              /// Form
              const HkLoginForm(),

              /// Divider
              HkFormDivider(dividerText: "or sign in with".capitalize!),
              const SizedBox(height: HkSizes.spaceBtwSections / 2,),

              /// Footer
              const HkSocialButtons()
            ],
          )
        )
      )
    );
  }
}

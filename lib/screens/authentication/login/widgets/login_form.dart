
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:poi_maps/screens/authentication/login/login_controller.dart';
import 'package:poi_maps/utils/validators/validation.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'package:get/get.dart';

import '../../../../navigation_menu.dart';
import '../../password_configuration/forget_passwrod.dart';
import '../../signup/signup.dart';


class HkLoginForm extends StatelessWidget {
  const HkLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: HkSizes.spaceBtwSections / 2),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: controller.email,
              validator: (value) => HkValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: "Email"
              ),
            ),
            const SizedBox(height: HkSizes.spaceBtwInputFields,),

            /// Password
            Obx(
              (){
                return TextFormField(
                  controller: controller.password,
                    validator: (value) => HkValidator.validateEmptyText('Password', value),
                    obscureText: controller.hidePassword.value,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        labelText:"Password",
                        suffixIcon: IconButton(icon: controller.hidePassword.value ? Icon(Iconsax.eye_slash ) : Icon(Iconsax.eye),
                          onPressed: (){

                            controller.hidePassword.value = !controller.hidePassword.value;
                          },)
                    )
                );
              }
            ),
            const SizedBox(height: HkSizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget Password
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Remember Me
                  Row(
                    children: [
                      Obx(()=> Checkbox(value: controller.rememberMe.value, onChanged: (value) {
                        controller.rememberMe.value = !controller.rememberMe.value;
                      },)),
                      const Text("Remember Me"),
                    ],
                  ),

                  /// Forget Password
                  Expanded(child: Align(alignment: Alignment.centerRight,
                      child: TextButton(onPressed: ()=> Get.to(()=> const ForgetPassScreen()),
                          child: const Text("Forget Password?",textAlign: TextAlign.right,))))

                ]
            ),
            const SizedBox(height: HkSizes.spaceBtwSections,),

            /// Sign In Button
            SizedBox(width: double.infinity,
                child: Obx(() =>  ElevatedButton(
                    onPressed: ()=> controller.emailAndPasswordSignIn(),
                    child: controller.buttonLoading.value
                        ?  const SizedBox(
                        height: 22,width: 22,
                        child: CircularProgressIndicator(color: Colors.white,))
                        : const Text("Sign In") ))),
            const SizedBox(height: HkSizes.spaceBtwItems / 2),

            /// Create Account Button
            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: ()=> Get.to(()=> const SignUpScreen()), child: const Text("Create Account")))
          ],
        ),
      ),
    );
  }
}
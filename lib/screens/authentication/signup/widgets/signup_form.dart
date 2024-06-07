import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:poi_maps/screens/authentication/signup/controller/signup_controller.dart';
import 'package:poi_maps/screens/authentication/signup/widgets/terms_conditions_checkbox.dart';
import 'package:poi_maps/utils/validators/validation.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../utils/constants/images.dart';
import '../../login/login.dart';

class HkSignUpForm extends StatelessWidget {
  const HkSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => HkValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: HkTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: HkSizes.spaceBtwInputFields,),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => HkValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration:  const InputDecoration(labelText: HkTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              )
            ],
          ),
          const SizedBox(height: HkSizes.spaceBtwInputFields,),

          /// Username
          TextFormField(
            controller: controller.username,
            validator: (value) => HkValidator.validateEmptyText('Username', value),
            decoration: const InputDecoration(labelText: HkTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: HkSizes.spaceBtwInputFields,),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => HkValidator.validateEmail(value),
            decoration: const InputDecoration(labelText: "Email", prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: HkSizes.spaceBtwInputFields,),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => HkValidator.validateEmptyText('Phone number', value),
            decoration:const InputDecoration(labelText: HkTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: HkSizes.spaceBtwInputFields,),

          /// Password
          Obx(
            ()=> TextFormField(
              controller: controller.password,
              validator: (value) => HkValidator.validateEmptyText('Password', value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(labelText: HkTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)
                  )
              ),
            ),
          ),
          const SizedBox(height: HkSizes.spaceBtwSections,),

          /// Terms&Conditions Checkbox
          const HkTermsAndConditionCheckbox(),
          const SizedBox(height: HkSizes.spaceBtwSections,),

          /// SignUp Button
          SizedBox(width:double.infinity, child: Obx(
            () => ElevatedButton(
                onPressed: ()=> controller.signup(),
                child: controller.buttonLoading.value
                    ? const SizedBox(
                    height: 22,width: 22,
                    child: CircularProgressIndicator(color: Colors.white,)) : const Text(HkTexts.createAccount)),
          )),
          const SizedBox(height: HkSizes.spaceBtwSections,),


        ],
      ),
    );
  }
}


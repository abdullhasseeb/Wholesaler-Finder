


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:poi_maps/common/widgets/options_card.dart';
import 'package:poi_maps/screens/contribution/contribution.dart';
import 'package:poi_maps/utils/constants/colors.dart';

import '../../../common/widgets/section_heading.dart';
import '../../../utils/constants/sizes.dart';
import '../../contact_us/contact_us_screen.dart';

class SettingsOptions extends StatelessWidget {
  const SettingsOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Options Related to user
        const SectionHeading(title: 'User Settings',),
        const SizedBox(height: HkSizes.spaceBtwItems,),
        HkOptionsCard(icon: Iconsax.personalcard, title: 'Personal Details',onTap: (){},),
        HkOptionsCard(icon: Iconsax.timer_14, title: 'Contribution',onTap: ()=> Get.to(()=> const ContributionScreen())),
        HkOptionsCard(icon: Icons.contacts_outlined, title: 'Contact Details',onTap: (){}),
        HkOptionsCard(icon: Iconsax.setting_2, title: 'Wholesaler Settings',onTap: (){}),
        const SizedBox(height: HkSizes.spaceBtwSections,),

        /// Options Related to App
        const SectionHeading(title: 'App Settings'),
        const SizedBox(height: HkSizes.spaceBtwItems,),
        HkOptionsCard(icon: Icons.contact_mail_outlined, title: 'Contact us',onTap: ()=> Get.to(()=> const ContactUsScreen()),),
        HkOptionsCard(icon: Iconsax.security, title: 'Security',onTap: (){},),
        HkOptionsCard(icon: Iconsax.timer_14, title: 'Privacy Policy',onTap: (){}),
        HkOptionsCard(icon: Icons.policy_outlined, title: 'Terms of Service',onTap: (){}),
      ],
    );
  }
}






import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:poi_maps/common/widgets/appbar/appbar.dart';
import 'package:poi_maps/common/widgets/options_card.dart';
import 'package:poi_maps/data/repository/authentication/authentication_repository.dart';
import 'package:poi_maps/utils/constants/colors.dart';
import 'package:poi_maps/utils/constants/sizes.dart';

import '../../../common/widgets/user_profile/profile_heading.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HkAppBar(
        title: Text('Profile', style: Theme.of(context).textTheme.headlineMedium!.apply(color: HkColors.white),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Profile, Name & Email
              const HkProfileHeading(),
              const SizedBox(height: HkSizes.spaceBtwItems,),
              const Divider(color: HkColors.primary,),

              /// List of Options
              HkOptionsCard(icon: Iconsax.message, title: 'Inbox',onTap: (){},),
              HkOptionsCard(icon: Iconsax.save_2, title: 'Saved Wholesalers',onTap: (){},),
              HkOptionsCard(icon: Icons.backpack_outlined, title: 'Products / Samples',onTap: (){},),
              HkOptionsCard(icon: Iconsax.star, title: 'Feedback',onTap: (){},),
              HkOptionsCard(icon: Iconsax.bank, title: 'Payment',onTap: (){},),
              HkOptionsCard(icon: Iconsax.setting_2, title: 'Settings',onTap: (){},),
              HkOptionsCard(icon: Iconsax.logout, title: 'Logout',onTap: () => AuthenticationRepository.instance.logout()),
            ],
          ),
        ),
      ),
    );
  }
}

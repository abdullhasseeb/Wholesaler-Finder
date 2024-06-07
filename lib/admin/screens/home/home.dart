


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:poi_maps/admin/screens/contribution/contribution.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/widgets/options_card.dart';
import '../../../data/repository/authentication/authentication_repository.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../add_location/add_location.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HkColors.primary,
        title: const Text('Admin Panel',style: TextStyle(color: HkColors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Column(
            children: [
              HkOptionsCard(icon: Icons.location_on, title: 'Add Location', onTap: ()=> Get.to(() => const AddLocationScreen())),
              HkOptionsCard(icon: Icons.add_alarm_outlined, title: 'Contributions', onTap: ()=> Get.to(() => const ContributionScreen())),
              HkOptionsCard(icon: Iconsax.logout, title: 'Logout', onTap: () => AuthenticationRepository.instance.logout() ),

            ],
          ),
        ),
      ),
    );
  }
}

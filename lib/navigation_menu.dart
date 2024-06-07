


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:poi_maps/screens/authentication/profile/profile.dart';
import 'package:poi_maps/screens/home/home_screen.dart';
import 'package:poi_maps/screens/map/map.dart';
import 'package:poi_maps/screens/settings/settings.dart';
import 'package:poi_maps/utils/constants/colors.dart';
import 'package:poi_maps/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {




  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());
    return  Obx(
        () => Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (value) {
            setState(() {
              controller.selectedIndex.value = value;
            });
          },
          selectedIndex: NavigationController.instance.selectedIndex.value,
          elevation: 0,
          backgroundColor: dark ? HkColors.dark : HkColors.light,
          indicatorColor: HkColors.primary.withOpacity(0.2),
          destinations: const  [
            NavigationDestination(icon: Icon(Iconsax.home_1), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.map_1), label: 'Maps'),
            NavigationDestination(icon: Icon(Iconsax.setting_2), label: 'Settings'),
            NavigationDestination(icon: Icon(Iconsax.profile_circle), label: 'Profile'),
          ],
        ),
        body: controller.screens[controller.selectedIndex.value],
      ),
    );
  }
}


class NavigationController extends GetxController{
  static NavigationController get instance => Get.find();

  RxInt selectedIndex = 0.obs;

  List<Widget> screens = [
    const HomeScreen(),
    const MapScreen(),
    const SettingsScreen(),
    const ProfileScreen()
  ];
}

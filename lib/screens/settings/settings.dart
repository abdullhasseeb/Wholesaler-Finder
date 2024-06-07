

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:poi_maps/common/widgets/appbar/appbar.dart';
import 'package:poi_maps/screens/settings/widgets/settings_options.dart';
import 'package:poi_maps/utils/constants/colors.dart';
import 'package:poi_maps/utils/constants/images.dart';
import 'package:poi_maps/utils/constants/sizes.dart';
import 'package:poi_maps/utils/constants/text_strings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HkAppBar(
        title: Text('Settings', style: Theme.of(context).textTheme.headlineMedium!.apply(color: HkColors.white),),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(HkSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(height: HkSizes.spaceBtwItems,),
              /// Options Column
              SettingsOptions()

            ],
          ),
        ),
      ),
    );
  }
}





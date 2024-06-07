


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:poi_maps/common/styles/spacing_styles.dart';
import 'package:poi_maps/common/widgets/appbar/appbar.dart';
import 'package:poi_maps/common/widgets/text/section_heading.dart';
import 'package:poi_maps/screens/home/controller/home_controller.dart';
import 'package:poi_maps/screens/home/widgets/card_gridview.dart';
import 'package:poi_maps/screens/home/widgets/home_app_bar.dart';
import 'package:poi_maps/screens/home/widgets/promo_slider.dart';
import 'package:poi_maps/screens/home/widgets/search_field/search_field_and_results.dart';
import 'package:poi_maps/screens/home/widgets/welcome_container.dart';
import 'package:poi_maps/screens/map/controller/map_controller.dart';
import 'package:poi_maps/common/widgets/textfields/search_textfield.dart';
import 'package:poi_maps/utils/constants/images.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/device/device_utility.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return const Scaffold(
      appBar: HkHomeAppBar(),
      body: Column(
        children: [
          HkWelcomeContainer(),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: HkSpacingStyle.homeScreenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    /// Category Heading
                    HkSectionHeading(title: 'Categories'),
                    SizedBox(height: HkSizes.spaceBtwItems/2),

                    /// GridView of items
                    HkCardGridView(),

                    /// Featured Heading
                    HkSectionHeading(title: 'Featured Listings'),
                    SizedBox(height: HkSizes.spaceBtwItems/2),

                    HkPromoSlider()



                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}






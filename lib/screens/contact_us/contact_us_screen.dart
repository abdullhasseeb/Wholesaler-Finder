import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_maps/common/widgets/appbar/appbar.dart';
import 'package:poi_maps/utils/constants/colors.dart';
import 'package:poi_maps/utils/constants/images.dart';
import 'package:poi_maps/utils/constants/sizes.dart';

import 'widget/contact_info_card.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HkAppBar(showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(image: AssetImage(HkImages.contactUs),),
                    const SizedBox(height: 10),
                    Text(
                      'Contact Us',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 20),
                    ContactInfoCard(
                      icon: Icons.public,
                      label: 'Website',
                      value: 'www.finderwholesale.com',
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    ContactInfoCard(
                      icon: Icons.email,
                      label: 'Email',
                      value: 'finderwholesale@gmail.com',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../styles/spacing_styles.dart';

class SuccessScreen extends StatelessWidget {
  final String image, title, subtitle;
  final VoidCallback onPress;
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build succsese');
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: HkSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Image
              Image(image: AssetImage(image),
                width: MediaQuery.of(context).size.width * 0.6,),
              const SizedBox(height: HkSizes.spaceBtwSections,),

              /// Title % Subtitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: HkSizes.spaceBtwItems,),
              Text(subtitle, style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: HkSizes.spaceBtwSections,),

              /// Buttons
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed: onPress,
              child: const Text("Continue"),),)
            ],
          ),
        ),
      ),
    );
  }
}

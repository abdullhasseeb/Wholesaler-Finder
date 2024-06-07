import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_maps/admin/screens/contribution/controller/contribution_controller.dart';
import 'package:poi_maps/admin/screens/contribution/widgets/contribution_card.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class ContributionScreen extends StatelessWidget {
  const ContributionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContributionController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HkColors.primary,
        title: const Text('Contribution',style: TextStyle(color: HkColors.white),),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: HkSizes.sm, left: HkSizes.defaultSpace, right: HkSizes.defaultSpace, bottom: HkSizes.defaultSpace),
          child: Obx(
            () => controller.contributionsLoading.value
                ? const Center(
                  child: CircularProgressIndicator(
                      color: HkColors.primary,
                    ),
                )
                : ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemCount: controller.contributionsList.value.length,
                    itemBuilder: (context, index) {
                      final contributionData = controller.contributionsList.value[index];
                      return HkContributionCard(
                        wholesalerName: contributionData.title,
                        address: contributionData.description,
                        category: contributionData.category,
                        tapOnAccept: () => controller.approveTheContribution(index),
                        tapOnDecline: () => controller.declineTheContribution(index),
                      );
                    },
                  ),
          )),
    );
  }
}

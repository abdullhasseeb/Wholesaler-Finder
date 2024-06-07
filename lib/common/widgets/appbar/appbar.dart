import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class HkAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final VoidCallback? leadingOnPressed;

  const HkAppBar(
      {super.key,
        this.title,
        this.showBackArrow = false,
        this.leadingIcon,
        this.actions,
        this.leadingOnPressed,
        this.backgroundColor = HkColors.primary});

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);

    return AppBar(
      backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        leading: showBackArrow ? IconButton(
          onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left),color: HkColors.white) :
          leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,

        title: title ,

      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(HkDeviceUtils.getAppBarHeight());
}

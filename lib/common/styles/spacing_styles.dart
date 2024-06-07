

import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class HkSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
      top: HkSizes.appBarHeight,
      left: HkSizes.defaultSpace,
      bottom: HkSizes.defaultSpace,
      right: HkSizes.defaultSpace
  );

  static const EdgeInsetsGeometry mapSearchTextFieldPadding = EdgeInsets.only(
      top: HkSizes.appBarHeight,
      left: HkSizes.defaultSpace,
      bottom: HkSizes.xs,
      right: HkSizes.defaultSpace
  );

  static const EdgeInsetsGeometry homeScreenPadding = EdgeInsets.only(
      top: HkSizes.spaceBtwItems,
      left: HkSizes.defaultSpace,
      bottom: HkSizes.defaultSpace,
      right: HkSizes.defaultSpace
  );


  static const EdgeInsetsGeometry homeSearchTextFieldPadding = EdgeInsets.only(
      top: HkSizes.appBarHeight,
      left: HkSizes.defaultSpace,
      bottom: HkSizes.xs,
      right: HkSizes.defaultSpace
  );
}

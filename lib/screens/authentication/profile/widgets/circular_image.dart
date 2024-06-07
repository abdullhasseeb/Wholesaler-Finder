import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poi_maps/utils/shimmer/shimmer_effect.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class HkCircularImage extends StatelessWidget {
  const HkCircularImage(
      {super.key,
      this.width = 56,
      this.height = 56,
      this.overlayColor,
      this.backgroundColor,
      required this.image,
      this.fit = BoxFit.cover,
      this.padding = HkSizes.sm,
      this.isNetworkImage = false});

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);

    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            color: backgroundColor ?? (dark ? HkColors.dark : HkColors.light),
            borderRadius: BorderRadius.circular(100)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    fit: fit,
                    color: overlayColor,
                    imageUrl: image,
                    progressIndicatorBuilder: (context, url, progress) =>
                        const HkShimmerEffect(
                      width: 70,
                      height: 70,
                      radius: 70,
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )
                : Image(
                    fit: fit,
                    image: AssetImage(image) as ImageProvider,
                    color: overlayColor),
          ),
        ));
  }
}

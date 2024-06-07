import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';

class HkGoogleImage extends StatelessWidget {
  const HkGoogleImage({
    super.key,
    this.width,
    this.height,
    required this.imageBytes,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = HkSizes.md,
  });

  final double? width, height;
  final Uint8List? imageBytes;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(border: border, color: backgroundColor, borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
            borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
            child: (imageBytes != null)
                ?
            Image(
              image: MemoryImage(imageBytes!),
              fit: fit,
            )
                :
            Image(
              image: const AssetImage(HkImages.defaultMarkerImage,),
              fit: fit,
            )
        ),
      ),
    );
  }
}

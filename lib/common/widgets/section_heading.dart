


import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  const SectionHeading({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.headlineSmall!.apply(color: HkColors.primary),);
  }
}

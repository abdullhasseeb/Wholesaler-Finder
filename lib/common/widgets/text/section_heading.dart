




import 'package:flutter/material.dart';

class HkSectionHeading extends StatelessWidget {
  final String title;
  const HkSectionHeading({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineSmall,),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class ContactInfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  const ContactInfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: HkColors.primary, 
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: HkSizes.iconLg, color: HkColors.grey,),
            const SizedBox(height: 10),
            Text(label, style: Theme.of(context).textTheme.headlineSmall!.apply(color: HkColors.grey,)),
            const SizedBox(height: 5),
            Text(value,style: Theme.of(context).textTheme.bodyLarge!.apply(color: HkColors.grey,)),
          ],
        ),
      ),
    );
  }
}

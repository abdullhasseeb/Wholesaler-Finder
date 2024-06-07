


import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';


class HkContributionCard extends StatelessWidget {
  final String wholesalerName;
  final String address;
  final String category;
  final VoidCallback tapOnAccept;
  final VoidCallback tapOnDecline;
  const HkContributionCard({
    super.key, required this.wholesalerName, required this.address, required this.category, required this.tapOnAccept, required this.tapOnDecline,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        /// Wholesaler's Name
        title: Text(wholesalerName, style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
      
        /// Done Tick Icon
        leading: IconButton(icon: const Icon(Icons.done,color: HkColors.primary),onPressed: tapOnAccept),
      
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Address of the location
            Text(address),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                /// Category of the wholesaler
                const Text('Category:',style: TextStyle(color:HkColors.primary,fontSize: 16,fontWeight: FontWeight.bold)),
                Text(category,style: const TextStyle(color:HkColors.primary,fontSize: 16,fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
      
        /// Cancel Icon
        trailing: IconButton(onPressed: tapOnDecline, icon: const Icon(Icons.wrong_location,color: HkColors.primary,)),
      ),
    );
  }
}
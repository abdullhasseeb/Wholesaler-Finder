







import 'package:flutter/material.dart';
import 'package:poi_maps/screens/contribution/contribution.dart';

import '../../home/controller/home_controller.dart';
import '../controller/contribution_controller.dart';



class HkLocationTextField extends StatelessWidget {
  const HkLocationTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ContributionController.instance.searchController.value,
      onChanged: (value) => ContributionController.instance.getLocations(value.toString()),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
          hintText: 'Search Location',
          border: OutlineInputBorder()
      ),
    );
  }
}

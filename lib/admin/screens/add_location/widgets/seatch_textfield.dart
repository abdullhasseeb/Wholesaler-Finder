



import 'package:flutter/material.dart';

import '../controller/add_location_controller.dart';

class HkSearchTextField extends StatelessWidget {
  const HkSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: AddLocationController.instance.searchController.value,
      onChanged: (value) => AddLocationController.instance.getLocations(value.toString()),
      decoration: const InputDecoration(
          hintText: 'Search Location',
          border: OutlineInputBorder()
      ),
    );
  }
}

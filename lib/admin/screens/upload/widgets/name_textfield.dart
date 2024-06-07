



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/upload_controller.dart';

class HkNameTextField extends StatelessWidget {
  const HkNameTextField({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadController());
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(1, 1),
            blurRadius: 2,
            spreadRadius: 1
          )
        ]
      ),
      child: TextFormField(
        validator: (value) {
          if(value == ''){
            return 'Please enter some text';
          }
        },
        controller: controller.nameController,
        decoration: const InputDecoration(
            hintText: 'Enter wholesaler shop name',
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          hintStyle: TextStyle(fontSize: 14),
          border: InputBorder.none
        ),
      ),
    );
  }
}
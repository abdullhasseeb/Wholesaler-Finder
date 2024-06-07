



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
    return TextFormField(
      validator: (value) {
        if(value == ''){
          return 'Please enter some text';
        }
      },
      controller: controller.nameController,
      decoration: const InputDecoration(
        border: InputBorder.none,
          errorBorder: InputBorder.none,
          hintText: 'Enter wholesaler\'s shop name',
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        hintStyle: TextStyle(fontSize: 14),
      ),
    );
  }
}
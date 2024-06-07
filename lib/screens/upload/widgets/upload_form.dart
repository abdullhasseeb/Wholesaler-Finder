


import 'package:flutter/material.dart';
import 'package:poi_maps/screens/upload/controller/upload_controller.dart';
import 'package:poi_maps/screens/upload/widgets/name_textfield.dart';

import '../../../utils/constants/sizes.dart';

class HkUploadForm extends StatelessWidget {
  const HkUploadForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Form(
      key: UploadController.instance.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Name TextField
          const HkNameTextField(),
          const SizedBox(height: HkSizes.spaceBtwSections,),

          /// Add into Map  Button
          ElevatedButton(onPressed: () async{
            await UploadController.instance.uploadData();
          } , child: const Text('Upload'))

        ],
      ),
    );
  }
}
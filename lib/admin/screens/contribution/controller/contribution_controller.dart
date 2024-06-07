


import 'package:get/get.dart';
import 'package:poi_maps/admin/data/repositories/contribution/contribution_repository.dart';

import '../../../../screens/map/models/marker_model.dart';
import '../../../../utils/helpers/dialog_functions.dart';

class ContributionController extends GetxController{
  static ContributionController get instance => Get.find();

  /// Variables
  RxList<MarkerModel> contributionsList = <MarkerModel>[].obs;
  RxBool contributionsLoading = false.obs;
  RxBool contributeDecision = false.obs;


  @override
  void onInit() {
    loadContributions();
    // TODO: implement onInit
    super.onInit();
  }

  loadContributions() async{
    try{
      /// Start Loading
      contributionsLoading.value = true;

      /// Fetch the contribution marker details
      contributionsList.value = await ContributionRepository().fetchMapContributions();


    }catch(e){
      HkDialogFunctions.showAlert('Oh', e.toString());
    } finally{
      ///Stop Loading
      contributionsLoading.value = false;
    }
  }


  /// Add contribution in actual locations when Accept the user contribution
  approveTheContribution(int index) async{

    try{

      /// Start Loading
      contributeDecision.value = true;

      /// Upload Marker to actual locations which is to be shown on the map
      await ContributionRepository().uploadToActualMarkers(index);

      /// now delete from FireStore database
      String documentId = contributionsList[index].id.toString();
      await ContributionRepository().deleteFromContribution(documentId);

      /// now delete from the RX contributions list
      contributionsList.removeAt(index);

    }catch(e){
      HkDialogFunctions.errorSnackBar(title: 'Oh snap',message: e.toString());
    }finally{
      contributeDecision.value = false;
    }
  }

  /// Delete contribution from contribution collection and actual locations
  declineTheContribution(int index) async{
    try{
      /// Start Loading
      contributeDecision.value = true;

      /// Remove contribution from fireStore {from contribution collection}
      String documentId = contributionsList[index].id.toString();
      await ContributionRepository().deleteFromContribution(documentId);

      /// Now Remove from Rx contributions list variable
      contributionsList.removeAt(index);

    }catch(e){
      HkDialogFunctions.errorSnackBar(title: 'Oh snap',message: e.toString());
    }finally{
      contributeDecision.value = false;
    }
  }

}
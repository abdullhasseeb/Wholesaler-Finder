



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_maps/screens/map/controller/map_controller.dart';
import 'package:poi_maps/utils/constants/sizes.dart';

import '../../../utils/constants/images.dart';
import '../../map/models/marker_model.dart';
import '../model/banner_model.dart';

class HomeController extends GetxController{
  static HomeController get instance => Get.find();


  /// Slider Variables
  List<String> categoryIcons = [HkImages.eatIcon,HkImages.electronicsIcon,HkImages.carIcon, HkImages.deliveryIcon, HkImages.cartIcon, HkImages.beautyIcon, HkImages.cleaningIcon, HkImages.moreIcon];
  List<String> categoryTexts = ['Food', 'Electronics', 'Car Parts', 'Delivery', 'Home Supplies', 'Beauty', 'Cleaning', 'More'];
  final carouselCurrentIndex = 0.obs;
  RxList<BannerModel> bannerDataList = [
    BannerModel(title: 'Discounts For Monday',subtitle: 'Same On Your First Order',discount: 5),
    BannerModel(title: 'Discounts For Monday',subtitle: 'Same On Your First Order',discount: 10),
    BannerModel(title: 'Discounts For Monday',subtitle: 'Same On Your First Order',discount: 100)
  ].obs;

  /// Search Field Variables
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();
  RxString searchText = ''.obs;
  RxList<MarkerModel> filteredMarkersData = <MarkerModel>[].obs;
  RxList<MarkerModel> markersData = MapController.instance.markersData.value.obs; // take loaded markers from map controller


  @override
  void dispose() {
    super.dispose();
    searchText.value = '';
    searchController.dispose();
    filteredMarkersData.clear();
  }

  void updatePageIndicator(index){
    carouselCurrentIndex.value = index;
  }



  /// Filter the data when search and store in FilteredMarkedData Variable
  void getFilteredMarker() async{

    if(searchText.value != ''){

      print(markersData);

      filteredMarkersData.value =  markersData.where(
              (element) {
            return element.title.toLowerCase().contains(
                searchText.toLowerCase());
          }).toList();

    }else{
      filteredMarkersData.clear();
    }
  }
}
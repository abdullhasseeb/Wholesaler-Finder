
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:poi_maps/data/services/api_services.dart';
import 'package:poi_maps/data/services/base_api_services.dart';
import 'package:poi_maps/screens/map/models/marker_details_model.dart';
import 'package:poi_maps/utils/exceptions/http_exceptions.dart';
import 'package:poi_maps/utils/exceptions/socket_exceptions.dart';
import 'package:poi_maps/utils/exceptions/timeout_exceptions.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/urls.dart';

class MarkerRepository extends GetxController{
  static MarkerRepository get instance => Get.find();

  /// Variables
  HkBaseApiServices apiServices = HkApiServices();



  /// Fetch Marker Details
  Future<MarkerDetailsModel> fetchMarkerDetails(String placeId) async{

    try{
      String markerDetailsUrl = HkUrls.getMarkerDetailsApi(placeId);

      /// Hit Api and get response in json
      final json = await apiServices.getApiResponse(markerDetailsUrl);

      /// Convert Json to Model
      return MarkerDetailsModel.fromJson(json['result']);

    }on TimeoutException catch(e) {
      throw HkTimeoutException.fromCase(e.message!);
    } on HttpException catch(e){
      throw HkHttpException.fromMessage(e.message);
    } on SocketException catch(e){
      throw HkSocketException.fromOsError(e.osError!);
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


  /// Fetch Marker Photos
  Future<Uint8List?> fetchImage(String photoReference, {int maxWidth = 400}) async {

    try{
      String photoUrl = HkUrls.getImageApi(maxWidth, photoReference);

      // Make a GET request to fetch the image
      final response = await get(Uri.parse(photoUrl));

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Decode the response body as bytes
        return response.bodyBytes;
      } else {
        throw HkHttpException.fromStatusCode(response.statusCode);
      }
    } on TimeoutException catch(e) {
      throw HkTimeoutException(e.message!);
    } on HttpException catch(e){
      throw HkHttpException(e.message);
    } on SocketException catch(e){
      throw HkSocketException.fromOsError(e.osError!);
    } catch(e){
      throw 'Something went wrong. Please try again';
    }

  }

}
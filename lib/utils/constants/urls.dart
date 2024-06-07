


class HkUrls{

  static const String mapApiKey = 'AIzaSyDHoFrJ1Gh3E4bOjZ9Jhh0SlxoK68K1b_4';

  /// Api Url for fetch all the details of the marker using place id
  static getMarkerDetailsApi(String placeId){

      String markerDetailsApi = 'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=name,formatted_address,rating,reviews,photos&key=$mapApiKey';

      return markerDetailsApi;
  }

  /// Api Url to find the place id of the marker
  static getMarkerPlaceIdApi(String latitude, String longitude){

    //String markerDetailsApi = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=150&key=$mapApiKey';
    String markerPlaceIdApi = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$mapApiKey';

    return markerPlaceIdApi;
  }

  /// Api Url for fetch the pictures from the google map using photo reference
  static getImageApi(int maxWidth, String photoReference){

    String markerImageApi = 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=$maxWidth&photoreference=$photoReference&key=$mapApiKey';

    return markerImageApi;
  }

  static getSuggestionUrl(String input, String sessionToken){

    String baseURL ='https://maps.googleapis.com/maps/api/place/autocomplete/json';

    String suggestionUrl = '$baseURL?input=$input&key=$mapApiKey&sessiontoken=$sessionToken';

    return suggestionUrl;
  }

  static const String directionsApi =
      'https://maps.googleapis.com/maps/api/directions/json?';


}
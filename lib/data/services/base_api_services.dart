abstract class HkBaseApiServices{

  Future<dynamic> getApiResponse(String url);

  Future<dynamic> postApiResponse({required String url, dynamic data, dynamic headers});

}
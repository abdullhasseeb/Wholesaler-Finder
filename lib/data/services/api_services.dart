import 'dart:convert';

import 'package:http/http.dart';

import '../../utils/exceptions/api_exceptions.dart';
import 'base_api_services.dart';

class HkApiServices extends HkBaseApiServices{

  @override
  Future getApiResponse(String url) async{
    dynamic responseJson;
    try{
      Uri uri = Uri.parse(url);

      final response = await get(uri).timeout(const Duration(seconds: 10));

      responseJson = await returnResponse(response);
      
    }catch(e){

      throw Exception(e);
    }
    return responseJson;
  }

  @override
  Future postApiResponse({required String url, dynamic data, dynamic headers}) async{
    dynamic responseJson;
    try{
      Uri uri = Uri.parse(url);
      Response response = await post(
          uri,
          headers: headers,
          body: data
      ).timeout(const Duration(seconds: 10));
      responseJson = await returnResponse(response);
    }catch(e){
      throw Exception(e);
    }
    return responseJson;
  }

  static returnResponse(Response response){
    switch(response.statusCode){
      case 100:
        throw ApiException(response.statusCode, message: 'Continue');
      case 101:
        throw ApiException(response.statusCode, message: 'Switching Protocols');
      case 102:
        throw ApiException(response.statusCode, message: 'Processing (WebDAV)');

      case 200:
      // Successful response, parse and return data
        return jsonDecode(response.body);
      case 201:
      // Handle status code 201 (Created) if needed
        return 'Resource created successfully';
      case 202:
      // Handle status code 202 (Accepted) if needed
        return 'Accepted';
      case 204:
      // Handle status code 204 (No Content) if needed
        return 'No Content';
      case 206:
      // Handle status code 206 (Partial Content) if needed
        return 'Partial Content';

      case 300:
        throw ApiException(response.statusCode, message: 'Multiple Choices');
      case 301:
        throw ApiException(response.statusCode, message: 'Moved Permanently');
      case 302:
        throw ApiException(response.statusCode, message: 'Found');
      case 304:
        throw ApiException(response.statusCode, message: 'Not Modified');
      case 307:
        throw ApiException(response.statusCode, message: 'Temporary Redirect');
      case 308:
        throw ApiException(response.statusCode, message: 'Permanent Redirect');

      case 400:
        throw ApiException(response.statusCode, message: 'Bad Request');
      case 401:
        throw ApiException(response.statusCode, message: 'Unauthorized');
      case 403:
        throw ApiException(response.statusCode, message: 'Forbidden');
      case 404:
        throw ApiException(response.statusCode, message: 'Not Found');
      case 405:
        throw ApiException(response.statusCode, message: 'Method Not Allowed');
      case 409:
        throw ApiException(response.statusCode, message: 'Conflict');
      case 410:
        throw ApiException(response.statusCode, message: 'Gone');
      case 429:
        throw ApiException(response.statusCode, message: 'Too Many Requests');

      case 500:
        throw ApiException(response.statusCode, message: 'Internal Server Error');
      case 501:
        throw ApiException(response.statusCode, message: 'Not Implemented');
      case 502:
        throw ApiException(response.statusCode, message: 'Bad Gateway');
      case 503:
        throw ApiException(response.statusCode, message: 'Service Unavailable');
      case 504:
        throw ApiException(response.statusCode, message: 'Gateway Timeout');
      case 505:
        throw ApiException(response.statusCode, message: 'HTTP Version Not Supported');

      default:
        throw ApiException(response.statusCode, message: 'Unhandled status code');
    }
  }
}
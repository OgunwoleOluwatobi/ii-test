import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ii_test/core/models/response.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ii_test/app/locator.dart';
import 'package:ii_test/core/exceptions/auth_exception.dart';
import 'package:ii_test/core/exceptions/network_exception.dart';
import 'package:ii_test/core/utils/logger.dart';
import '../../utils/network_utils.dart' as network_utils;

import 'http_service.dart';

/// Helper service that abstracts away common HTTP Requests
class HttpServiceImpl extends HttpService {
  final NavigationService _navigationService = locator<NavigationService>();

  final dio.Dio _dio = dio.Dio(dio.BaseOptions(connectTimeout: 50000));

  @override
  setHeader() {
    Map<String, dynamic> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'app-id': '6105e8ca2faf710b52bfe552'
    };

    _dio.options.headers.addAll(header);
  }

  @override
  void dispose() {
    _dio.clear();
    _dio.close(force: true);
  }

  @override
  clearHeaders() {
    _dio.options.headers.clear();
  }

  @override
  Future<FormattedResponse> getHttp(String route, {Map<String, dynamic>? params, bool refreshed: false}) async {
    dio.Response response;
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '${env['API']}$route';
    if(env['APP_DEBUG'] == 'true') {
      Logger.d('[GET] Sending $params to $fullRoute');
    }
    

    try {
      setHeader();
      response = await _dio.get(
        fullRoute,
        queryParameters: params,
        options: dio.Options(
          contentType: 'application/json',
        ),
      );
    } on dio.DioError catch (e) {
      
      if(env['APP_DEBUG'] == 'true') {
        Logger.e('HttpService: Failed to GET $fullRoute: Error message: ${e.message}');
      }
      
      if(env['APP_DEBUG'] == 'true') {
        debugPrint('Http response data is: ${e.response?.data}');
      }

      if (e.response?.statusCode == 401) {
        // _navigationService.clearStackAndShow(Routes.authenticate);
        throw AuthException('Invalid token and credentials');
      }
      // throw NetworkException(e.response?.data != null ? e.response.data['errors'] != null ? e.response.data['errors'][0] : e.message : e.message);
      //throw NetworkException( e.message); //e.response?.data != null ? e.response.data['message'] ?? e.message : e.message
      //
      if(e.response == null) {
        throw NetworkException(e.message);
      }
      if(e.response?.data == null) {
        throw NetworkException(e.message);
      }
      if(e.response?.data['errors'] is String) {
        throw NetworkException(
          e.response?.data['errors'] != null ? 
          e.response?.data['errors'][0] : 
          e.message
        );
      } else if(e.response?.data['errors'] is List) {
        String error = '';
        for(String item in e.response?.data['errors']) {
          error = error+'$item\n';
        }
        throw NetworkException(
          error
        );
      } else {
        String error = '';
        Map<String, dynamic> errors = network_utils.decodeResponseBodyToJson(e.response?.data)['errors'];
        for(String item in errors.keys) {
          error = error+'${errors[item]}\n';
        }
        throw NetworkException(
          error
        );
      }
    }

    if(env['APP_DEBUG'] == 'true') {
      Logger.d('Received Response: $response');
    }

    network_utils.checkForNetworkExceptions(response);
    return FormattedResponse(
      success: response.statusCode == 200,
      data: response.data
    );
  }
}
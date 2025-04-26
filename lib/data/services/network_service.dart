import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:haupcar/core/utils/constants.dart';
import 'package:haupcar/data/services/base_service.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:http_interceptor/models/retry_policy.dart';
import 'package:logger/logger.dart';

class NetworkService implements BaseService {
  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService.instance() => _instance;

  late final Client _client;
  final Logger _logger = Logger();

  NetworkService._internal() {
    _client = InterceptedClient.build(
      requestTimeout: const Duration(seconds: 10),
      interceptors: [],
      retryPolicy: TimeoutRetryPolicy(),
      client: IOClient(HttpClient()),
    );
  }

  @override
  Future<dynamic> get(String url, dynamic param) async {
    Uri uri = Uri.https(Constants.baseUrl, url, param);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    try {
      final response = await _client.get(uri, headers: headers);
      _logger.i(response.body);
      return jsonDecode(response.body);
    } on SocketException {
      _logger.i('Socket Exception! Failed host lookup');
      throw {"message": "Socket Exception! Failed host lookup"};
    } on TimeoutException {
      _logger.i('Request timeout!');
      throw {"message": "Request timeout!"};
    } catch (e) {
      _logger.i('$e');
      throw {"message": "$e"};
    }
  }
}

class TimeoutRetryPolicy extends RetryPolicy {
  @override
  int get maxRetryAttempts => 3;

  @override
  Future<bool> shouldAttemptRetryOnException(
          Exception reason, BaseRequest request) async =>
      true;

  @override
  Duration delayRetryAttemptOnResponse({required int retryAttempt}) =>
      Duration(milliseconds: (250 * math.pow(2.0, retryAttempt)).toInt());

  @override
  Future<bool> shouldAttemptRetryOnResponse(BaseResponse response) async =>
      false;
}

abstract class Interceptor {
  Future<void> onRequest(BaseRequest request);
  Future<void> onResponse(StreamedResponse response);
}

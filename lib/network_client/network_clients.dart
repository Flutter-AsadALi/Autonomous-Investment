import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/app_preferences_controller/prefrences_controller.dart';
import '../model/api_response/api_response.dart';
import '../resources/session_controller/session_controller.dart';
import '../utils/app_consts.dart';
import '../utils/preference_labels.dart';
import '../utils/show_messages.dart';

class NetworkClient {
  static const contentTypeJson = 'application/json';

  final Dio _restClient;

  NetworkClient() : _restClient = _createDio(AppConsts.baseUrl);

  Future<ApiResponse<T>> post<T>(
      String path, {
        required BuildContext context,
        required Map<String, dynamic> data,
        Map<String, dynamic>? queryParameters,
        bool? sendUserAuth,
      }) async {
    log("Payload: $data");
    log("Path: $path");
    try {
      final Options options = await _getDioOptions(context, path, sendUserAuth);
      final response = await _restClient.post(
        path,
        data: FormData.fromMap(data),
        queryParameters: queryParameters,
        options: options,
      );

      log("Response: ${response.data}");

      return _processResponse<T>(response, context);
    } on DioException catch (e) {
      log("DioError: $e");
      showErrorMessage("Failed to connect to server", context: context);
      return _createErrorResponse<T>(e);
    } catch (e, stacktrace) {
      log("General Exception: $e");
      log("Stacktrace: $stacktrace");
      showErrorMessage("An unexpected error occurred", context: context);
      return ApiResponse<T>.error(
        statusCode: null,
        message: 'An unexpected error occurred',
      );
    }
  }


  Future<ApiResponse<T>> get<T>(
      String path, {
        required BuildContext context,
        Map<String, dynamic>? queryParameters,
        bool? sendUserAuth,
      }) async {
    log("GET Path: $path");
    log("Query Params: $queryParameters");

    try {
      final Options options = await _getDioOptions(context, path, sendUserAuth);
      final response = await _restClient.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );

      log("GET Response: ${response.data}");

      return _processResponse<T>(response, context);
    } on DioException catch (e) {
      log("GET DioError: $e");
      showErrorMessage("Failed to connect to server", context: context);
      return _createErrorResponse<T>(e);
    } catch (e, stacktrace) {
      log("GET General Exception: $e");
      log("Stacktrace: $stacktrace");
      showErrorMessage("An unexpected error occurred", context: context);
      return ApiResponse<T>.error(
        statusCode: null,
        message: 'An unexpected error occurred',
      );
    }
  }


  Future<Options> _getDioOptions(BuildContext context, String path, bool? sendUserAuth) async {
    final isPreLogin = path.split("/").last.contains("labels") ||
        path.split("/").last.contains("products") ;

    return isPreLogin
        ? _createDioOptionsBeforeLogin(contentType: contentTypeJson, sendUserAuth: sendUserAuth)
        : _createDioOptionsAfterLogin(context: context, contentType: contentTypeJson, sendUserAuth: sendUserAuth);
  }

  ApiResponse<T> _processResponse<T>(Response response, BuildContext context) {
    final Map<String, dynamic> jsonData = response.data;
    final int? code = jsonData['code'];
    log("API Code: $code");

    if (code == 0||response.statusCode==200) {
      return ApiResponse<T>.success(
        statusCode: response.statusCode,
        rawData: jsonData,
      );
    } else {
      final message = jsonData['message'] ?? 'Unknown error';
      keyMessages(context, message);
      return ApiResponse<T>.error(
        statusCode: response.statusCode,
        message: message,
      );
    }
  }

  ApiResponse<T> _createErrorResponse<T>(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiResponse<T>.error(
          statusCode: 500,
          message: 'Failed to connect to server',
        );
      case DioExceptionType.badResponse:
        log('DioException Response: ${error.response?.data}');
        final message = error.response?.data['message'] ?? 'Unknown error';
        return ApiResponse<T>.error(
          statusCode: error.response?.statusCode,
          message: message,
        );
      case DioExceptionType.cancel:
        return ApiResponse<T>.error(
          statusCode: 500,
          message: 'Request canceled',
        );
      case DioExceptionType.unknown:
      case DioExceptionType.connectionError:
      case DioExceptionType.badCertificate:
        return ApiResponse<T>.error(
          statusCode: 500,
          message: 'Something went wrong, try again later',
        );
      default:
        return ApiResponse<T>.error(
          statusCode: 500,
          message: 'Unknown error occurred',
        );
    }
  }

  Future<Options> _createDioOptionsBeforeLogin({
    required String contentType,
    bool? sendUserAuth,
  }) async {
    log("Creating Dio options before login");
    final headers = {
      'x-api-key': AppConsts.apiKey,
    };
    return Options(
      headers: headers,
      contentType: contentType,
    );
  }

  Future<Options> _createDioOptionsAfterLogin({
    required BuildContext context,
    required String contentType,
    bool? sendUserAuth,
  }) async {
    log("Creating Dio options after login");

    // Fetch the latest auth token from AppPreferencesProvider
    final appPrefs = Provider.of<AppPreferencesProvider>(context, listen: false);
    String? authToken = await appPrefs.getString(AppPreferencesLabels.authToken);

    if (authToken != null && authToken.isNotEmpty) {
      // Update the SessionController with the latest authToken
      SessionController.authToken = authToken;
    }

    final headers = {
      'x-api-key': AppConsts.apiKey,
      'Authorization': "Bearer ${SessionController.authToken}",
    };

    return Options(
      headers: headers,
      contentType: contentType,
    );
  }

  static Dio _createDio(String baseUrl) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    );
    final dio = Dio(options);
    dio.interceptors.add(LogInterceptor(
      requestHeader: false,
      responseBody: true,
    ));
    return dio;
  }
}

void keyMessages(BuildContext context, String key) {
  // final labelsController = Provider.of<LabelProvider>(context, listen: false);
  final appPreferencesProvider = Provider.of<AppPreferencesProvider>(context, listen: false);

  switch (key) {
    case "key_user_exists":
      // showErrorMessage(labelsController.labelModel.data!.keys!.keyUserExists!, context: context);
      break;
      case "key_user_not_found":
      showErrorMessage("User Not Found", context: context);
      break;
    case "key_password_invalid":
      // showErrorMessage(labelsController.labelModel.data!.keys!.keyPasswordInvalid!, context: context);
      break;
    case "key_wrong_password":
      // showErrorMessage(labelsController.labelModel.data!.keys!.keyWrongPassword!, context: context);
      break;
    case "key_login_success":
      // showSuccessMessage(labelsController.labelModel.data!.keys!.keyLoginSuccess!, context: context);
      break;
    case "key_token_error":
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
      // showSuccessMessage(labelsController.labelModel.data!.keys!.keyTokenError!, context: context);
      break;
    case "key_app_logout_successful":
      // showSuccessMessage(labelsController.labelModel.data!.keys!.keyAppLogoutSuccessful!, context: context);
      break;
      case "key_device_not_found":
        // showErrorMessage(labelsController.labelModel.data!.keys!.keyUserNotFound!, context: context);
      break;
    case "key_stores_not_found":
      appPreferencesProvider.clearEncryptedPrefs();
      appPreferencesProvider.remove(AppPreferencesLabels.authToken);
      appPreferencesProvider.remove(AppPreferencesLabels.isLogedin);
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
      // showErrorMessage(labelsController.labelModel.data!.keys!.keyUserNotFound!, context: context);
      break;
    default:
      showErrorMessage("Unknown key: $key", context: context);
      break;
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_find_funny/utils/utils.dart';

/// `Dio Util`
class DioUtil {
  static DioUtil get instance => _getInstances();
  static DioUtil _instance;
  Dio _dio;

  DioUtil._internal() {
    if (_dio == null) _dio = _initDio();
  }

  static DioUtil _getInstances() {
    if (_instance == null) {
      _instance = DioUtil._internal();
    }
    return _instance;
  }

  Dio _initDio() {
    // BaseOptions
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: 3000,
        receiveTimeout: 3000,
        sendTimeout: 3000,
        baseUrl: '',
        responseType: ResponseType.json,
      ),
    );
    // request 拦截
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          dio.lock();
          // String access_token = SpUtil.getToken;
          // if (access_token != null) {
          //   options.headers['access_token'] = access_token;
          // }
          log('headers: ${options.headers}');
          dio.unlock();
          return options;
        },
        onResponse: (Response response) {
          // if (response.statusCode == 401) {
          //   showToast('登录失效，请重新登录');
          //   clearToken();
          // }
          var res = json.decode(response.data);
          if (res['code'] == 401 || res['code'] == 4102) {
            showToast('登录过期,请重新登录');
            // clearToken();
          } else
            return response;
        },
        onError: (DioError e) {
          switch (e.type) {
            case DioErrorType.CONNECT_TIMEOUT:
              showToast('连接超时，请稍候重试');
              break;
            case DioErrorType.RECEIVE_TIMEOUT:
              showToast('接收超时，请稍候重试');
              break;
            case DioErrorType.SEND_TIMEOUT:
              showToast('发送超时，请稍候重试');
              break;
            case DioErrorType.CANCEL:
              showToast('请求取消!');
              break;
            case DioErrorType.RESPONSE:
              showToast('请求超时!');
              break;
            default:
              showToast('登录失效，请重新登录！');
            // clearToken();
          }
        },
      ),
    );
    // 日志
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      requestHeader: true,
    ));
    // Cookie管理
    dio.interceptors.add(CookieManager(CookieJar()));
    return dio;
  }

  /// post请求
  Future post(
    String url, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
  }) async {
    Response response;
    try {
      response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      print('入参:$data');
    } on DioError catch (e) {
      print('POST ERROR-----------${e.response}');
      formatError(e);
    }
    return response?.data;
  }

  /// get请求
  Future<Response> get(
    String url, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
  }) async {
    Response response;
    try {
      response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      // return response?.data;
    } on DioError catch (e) {
      print('get error---------$e');
      formatError(e);
    }
    return response;
  }

  // 清除失效token
  // void clearToken() async {
  //   final isRemove = await SpUtil.removeSpToken();
  //   await SpUtil.removeLoginInfo();
  //   if (isRemove == true) {
  //     navigatorState.pushNamedAndRemoveUntil(
  //         Routes.onlineLoginPage, (route) => false,
  //         arguments: {
  //           'allowClose': false,
  //         });
  //   }
  // }

  /*
   * error统一处理
   */
  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      // It occurs when url is opened timeout.
      showToast("连接超时");
      dismissLoading();
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      // It occurs when url is sent timeout.
      showToast("请求超时");
      dismissLoading();
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      //It occurs when receiving timeout
      showToast("响应超时");
      dismissLoading();
    } else if (e.type == DioErrorType.RESPONSE) {
      // When the server response, but with a incorrect status, such as 404, 503...
      showToast("dio_util请求出现异常");
      dismissLoading();
    } else if (e.type == DioErrorType.CANCEL) {
      // When the request is cancelled, dio will throw a error with this type.
      showToast("请求取消");
      dismissLoading();
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      showToast("未知错误");
      dismissLoading();
    }
  }
}

import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_app78/model/response-data.dart';

class Http {

    static BaseOptions options = new BaseOptions(
        baseUrl: 'http://10.0.2.2:2000',
//        baseUrl: 'http://47.106.211.59:8008/api',
        connectTimeout: 10000,
        receiveTimeout: 3000,
        contentType: 'application/json; charset=UTF-8',
        headers: {
            HttpHeaders.acceptHeader:'application/json, text/plain, */*',
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
        },
    );
    var dio = new Dio(options);

    Http() {
        dio.interceptors.add(InterceptorsWrapper(
            onResponse: (Response response) async {
                print(response.data.runtimeType);
            },
            onRequest: (RequestOptions requestOptions) {
                print(requestOptions);
            },
            onError: (DioError dioError) {
                print(dioError);
            }
        ));
    }

    get(String path, {Map<String, dynamic> data, Options options}) {
        return dio.get(path, queryParameters: data, options: options)
            .then((response) => DioResponseBody(response.data));
    }

    post(String path, {data, Options options}) {
        data = json.encode(data);
        return dio.post(path, data: data, options: options)
            .then((response) => DioResponseBody(response.data));
    }
}
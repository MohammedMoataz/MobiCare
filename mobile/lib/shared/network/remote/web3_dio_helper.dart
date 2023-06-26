import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../constants/constants.dart';

class Web3DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    final String url = "api.web3.storage/upload",
    required Uint8List data,
  }) async {
    dio!.options.headers = {
      'accept': 'application/json',
      'Authorization': "Bearer $web3StorageToken",
      'Content-Type': '*/*',
    };
    return await dio!.post(url, data: data);
  }

  static Future<Response> getData({
    final String path = 'ipfs.w3s.link',
    required String param,
  }) async {
    dio!.options.headers = {
      'accept': 'application/json',
      'Authorization': "Bearer $web3StorageToken",
    };
    return await dio!.get("w3s.link/ipfs/$param/");
  }
}

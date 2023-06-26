import 'package:dio/dio.dart';
import 'package:mobi_care/shared/network/remote/ip_address.dart';

class DioHelper {

  static Dio ? dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://$IP4v:5000',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String path ,
    Map<String , dynamic> ? queryParameters,
    String ? token,
  }) async{
    dio!.options.headers = {
      'Authorization' : token,
    };
    return await dio!.get(path , queryParameters: queryParameters);
  }

  static Future<Response> postData ({
    required String url,
    required Map <String , dynamic> data,
    String ? token,
  }) async{
    print("$url: $data: $token");
    return await dio!.post(
        url,
        data: data,
    );
  }

  static Future<Response> putData ({
    required String url,
    Map <String , dynamic> ? data,
    Map<String , dynamic> ? queryParameters,
    String ? token,
  }) async{
    print(url);
    print(data);
    print(token);
    dio!.options.headers = {
      'Authorization' : token,
    };
    return await dio!.put(url , data: data, queryParameters: queryParameters);
  }

  static Future<Response> patchData ({
    required String url,
    Map<String , dynamic> ? query,
    required Map <String , dynamic> data,
    String ? token,
  }) async{
    dio!.options.headers = {
      'Authorization' : token,
    };
    return await dio!.patch(
        url,
        queryParameters: query,
        data: data
    );
  }

}

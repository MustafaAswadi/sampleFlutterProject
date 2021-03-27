import 'package:sample_flutter_project/business_logic/models/blog.dart';
import 'package:dio/dio.dart';
import 'package:sample_flutter_project/services/service_locator.dart';
import 'package:sample_flutter_project/services/storage/storage_service.dart';

class WebApi {
  Future<List<Map<String, dynamic>>> getBlogList() async {
    String token = await getToken();
    Response response;
    try {
      response = await Dio().get(
          "https://60585b2ec3f49200173adcec.mockapi.io/api/v1/blogs",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
    } on DioError catch (e) {
      print(e.message);
      print(e.response);
    }
    print(response);
    return response.data;
  }

  Future<String> getToken() async {
    Response response = await Dio().post(
        'https://60585b2ec3f49200173adcec.mockapi.io/api/v1/login',
        data: {"email": "aswadimustafa@gmail.com", "password": "muafa123"});
    print(response.data['token']);
    serviceLocator.get<StorageService>().setToken(response.data['token']);
    return response.data['token'];
  }

  Future<Blog> getBlog(int id) async {
    String token = await getToken();
    Response response = await Dio().get(
        "https://60585b2ec3f49200173adcec.mockapi.io/api/v1/blogs/{$id}",
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    return response.data;
  }
}

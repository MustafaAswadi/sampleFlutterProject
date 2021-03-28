import 'package:sample_flutter_project/business_logic/models/blog.dart';
import 'package:dio/dio.dart';
import 'package:sample_flutter_project/services/service_locator.dart';
import 'package:sample_flutter_project/services/storage/storage_service.dart';

class WebApi {
  List<Blog> _blogs;
  Blog blog;
  Future<List<Blog>> getBlogList() async {
    String token = await serviceLocator.get<StorageService>().getToken();
    Response response;
    try {
      response = await Dio().get(
          "https://60585b2ec3f49200173adcec.mockapi.io/api/v1/blogs",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
    } on DioError catch (e) {
      print(e.message);
      print(e.response);
    }
    _blogs = (response.data as List).map((i) => Blog.fromJson(i)).toList();
    print(response);
    return _blogs;
  }

  Future<String> getToken(String email, String password) async {
    Response response;
    try {
      response = await Dio().post(
          'https://60585b2ec3f49200173adcec.mockapi.io/api/v1/login',
          data: {"email": email, "password": password});
    } on DioError catch (e) {
      print(e.message);
    }

    print(response.data['token']);
    await serviceLocator
        .get<StorageService>()
        .setToken(response.data['token'].toString());
    // String token = await serviceLocator.get<StorageService>().getToken();
    // print(token);
    return response.data['token'];
  }

  Future getBlog(int id) async {
    String token = await serviceLocator.get<StorageService>().getToken();
    Response response;
    try {
      response = await Dio().get(
          "https://60585b2ec3f49200173adcec.mockapi.io/api/v1/blogs/$id",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
    } on DioError catch (e) {
      print(e.message);
      print(e.response);
    }
    print(response.data);
    blog = Blog.fromJson(response.data);
    print(blog);
    return blog;
  }
}

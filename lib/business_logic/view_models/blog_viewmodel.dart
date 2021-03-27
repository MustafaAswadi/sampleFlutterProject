import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sample_flutter_project/services/service_locator.dart';
import 'package:sample_flutter_project/business_logic/models/blog.dart';
import 'package:sample_flutter_project/services/web_api/web_api_service.dart';

class BlogViewModel extends ChangeNotifier {
  final WebApi _webApiService = serviceLocator.get<WebApi>();

  Blog _blog;

  Blog get blog => _blog;

  void loadBlog(int id) async {
    Blog _blog = await _webApiService.getBlog(id);
    _prepareBlogToShow(_blog);
    notifyListeners();
  }

  void _prepareBlogToShow(Blog blog) {
    _blog = blog;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sample_flutter_project/services/service_locator.dart';
import 'package:sample_flutter_project/business_logic/models/blog.dart';
import 'package:sample_flutter_project/services/web_api/web_api_service.dart';

class BlogViewModel extends ChangeNotifier {
  final WebApi _webApiService = serviceLocator.get<WebApi>();

  Blog _blog;
  // bool isLoading = true;
  Blog get blog => _blog;

  void loadBlog(int id) async {
    final _myBlog = await _webApiService.getBlog(id);

    // _prepareBlogToShow(_blog);
    print("joooooooon    $_myBlog");
    _blog = _myBlog;
    notifyListeners();
  }
  void showCircularLoading() {
    
    notifyListeners();
  }
}

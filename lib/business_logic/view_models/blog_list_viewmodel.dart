import 'package:flutter/foundation.dart';
import 'package:sample_flutter_project/services/service_locator.dart';
import 'package:sample_flutter_project/services/web_api/web_api_service.dart';
import 'package:sample_flutter_project/business_logic/models/blog.dart';

class BlogListViewModel extends ChangeNotifier {
  final WebApi _webApiService = serviceLocator<WebApi>();

  List<Blog> _blogs = [];

  List<Blog> get blogs => _blogs;

  void loadData() async {
    final _blogs = await _webApiService.getBlogList();
    _prepareBlogsToShow(_blogs);
    notifyListeners();
  }

  void _prepareBlogsToShow(List<Blog> blogs) {
    List<Blog> list = [];
    for (var blog in blogs) {
      list.add(blog);
    }
    _blogs = list;
  }

  void showCircularLoading() {
    notifyListeners();
  }
}

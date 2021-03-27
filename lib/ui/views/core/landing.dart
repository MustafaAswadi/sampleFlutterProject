import 'package:flutter/material.dart';
import 'package:sample_flutter_project/business_logic/view_models/user_token_viewmodel.dart';
import 'package:sample_flutter_project/services/service_locator.dart';
import 'package:sample_flutter_project/services/storage/storage_service.dart';
import 'package:sample_flutter_project/ui/views/blogList/blog_list_page.dart';
import 'package:sample_flutter_project/ui/views/login/login_page.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          Stream.fromFuture(serviceLocator<UserTokenViewModel>().loadData()),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return LoginPage();
        } else {
          return BlogListPage();
        }
      },
    );
  }
}

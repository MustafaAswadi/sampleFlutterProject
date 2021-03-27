import 'package:flutter/material.dart';
import 'package:sample_flutter_project/business_logic/view_models/blog_list_viewmodel.dart';
import 'package:sample_flutter_project/config/theme/textStyle.dart';
import 'package:sample_flutter_project/services/service_locator.dart';
import 'package:sample_flutter_project/services/web_api/web_api_service.dart';
import 'package:sample_flutter_project/ui/views/blogList/blog_container.dart';
import 'package:provider/provider.dart';

class BlogListPage extends StatefulWidget {
  @override
  _BlogListPageState createState() => _BlogListPageState();
}

class _BlogListPageState extends State<BlogListPage> {
  BlogListViewModel blogListViewModel = serviceLocator.get<BlogListViewModel>();

  @override
  void initState() {
    blogListViewModel.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .9001,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0)),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Blogs",
                      style: MyCustomTextStyle().myStyle,
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * .75,
                      margin: EdgeInsets.only(top: 50.0),
                      child: ChangeNotifierProvider<BlogListViewModel>(
                        create: (context) => blogListViewModel,
                        child: Consumer<BlogListViewModel>(
                          builder: (context, model, child) => ListView.builder(
                            itemCount: model.blogs.length,
                            itemBuilder: (ctx, i) {
                              return BlogContainer();
                            },
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

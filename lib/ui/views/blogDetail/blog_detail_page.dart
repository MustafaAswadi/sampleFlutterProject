import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sample_flutter_project/business_logic/view_models/blog_viewmodel.dart';
import 'package:sample_flutter_project/config/theme/textStyle.dart';
import 'package:sample_flutter_project/services/service_locator.dart';
import 'package:sample_flutter_project/services/web_api/web_api_service.dart';

class BlogDetailPage extends StatefulWidget {
  final int id;
  final String title;
  final String createdAt;
  final String imageUrl;
  BlogDetailPage({this.id, this.createdAt, this.imageUrl, this.title});

  @override
  _BlogDetailPageState createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  BlogViewModel _webApiService = serviceLocator.get<BlogViewModel>();

  @override
  void initState() {
    _webApiService.loadBlog(widget.id);
    print(widget.id);
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
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
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
              child: ChangeNotifierProvider<BlogViewModel>(
                create: (context) => _webApiService,
                child: Consumer<BlogViewModel>(
                  builder: (context, model, child) {
                    if (model.blog == null) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Column(
                        children: [
                          SizedBox(
                            height: 50.0,
                          ),
                          CircleAvatar(
                            radius: 80.0,
                            backgroundImage: NetworkImage(model.blog.imageUrl),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            model.blog.title,
                            style: MyCustomTextStyle().myStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            model.blog.createdAt,
                            style: TextStyle(fontSize: 15.0),
                          )
                        ],
                      );
                    }
                  },
                ),
              )),
        ],
      ),
    ));
  }
}

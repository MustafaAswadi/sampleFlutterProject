import 'package:flutter/material.dart';
import 'package:sample_flutter_project/config/theme/textStyle.dart';
import 'package:sample_flutter_project/ui/views/blogDetail/blog_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BlogContainer extends StatelessWidget {
  final int id;
  final String title;
  final String createdAt;
  final String imageUrl;

  BlogContainer({this.id, this.createdAt, this.imageUrl, this.title});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlogDetailPage(
                      id: id,
                      createdAt: createdAt,
                      imageUrl: imageUrl,
                      title: title,
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(5.0),
        height: 50.0,
        width: 100.0,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.1),
          borderRadius: BorderRadius.all(
            Radius.circular(1.0),
          ),
        ),
        child: Row(
          children: [
            Container(
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) => CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: MyCustomTextStyle().myStyle.copyWith(
                        fontSize: 15.0,
                      ),
                ),
                Text(createdAt, style: TextStyle(color: Colors.black)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

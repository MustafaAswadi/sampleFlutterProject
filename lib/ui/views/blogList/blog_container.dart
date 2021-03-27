import 'package:flutter/material.dart';
import 'package:sample_flutter_project/config/theme/textStyle.dart';
import 'package:sample_flutter_project/ui/views/blogDetail/blog_detail_page.dart';

class BlogContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BlogDetailPage()));
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
              child: Image.asset('assets/images/test.jpg'),
            ),
            SizedBox(
              width: 5.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'title of blog',
                  style: MyCustomTextStyle().myStyle.copyWith(
                        fontSize: 15.0,
                      ),
                ),
                Text("created at 2021", style: TextStyle(color: Colors.black)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

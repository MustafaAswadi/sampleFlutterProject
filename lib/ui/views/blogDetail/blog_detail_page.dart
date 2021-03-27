import 'package:flutter/material.dart';
import 'package:sample_flutter_project/config/theme/textStyle.dart';

class BlogDetailPage extends StatefulWidget {
  @override
  _BlogDetailPageState createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
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
              child: Column(
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage("assets/images/test.jpg"),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Title of blog',
                    style: MyCustomTextStyle().myStyle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "created at: 2021",
                    style: TextStyle(fontSize: 15.0),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

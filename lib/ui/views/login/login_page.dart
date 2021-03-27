import 'package:flutter/material.dart';
import 'package:sample_flutter_project/services/service_locator.dart';
import 'package:sample_flutter_project/services/web_api/web_api_service.dart';
import 'package:sample_flutter_project/ui/views/login/textField_widget.dart';
import 'package:sample_flutter_project/config/theme/textStyle.dart';
import 'package:sample_flutter_project/ui/views/blogList/blog_list_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.only(top: myHeight * .15),
              child: Text(
                "Sample\n     Flutter\n         \t\tApp",
                style: MyCustomTextStyle().myStyle.copyWith(fontSize: 20.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: myHeight / 2 * .2),
            height: myHeight,
            width: myWidth,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(70.0))),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40.0),
                  child: Text(
                    "Login",
                    style: MyCustomTextStyle().myStyle,
                  ),
                ),
                MyCustomTextField("Email"),
                MyCustomTextField("Password"),
                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  width: 200.0,
                  child: RaisedButton(
                    color: Colors.black,
                    onPressed: () {
                      // serviceLocator.get<WebApi>().getToken();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlogListPage()));
                    },
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 30.0),
                    child: Text("Don't have an account? sign up"))
              ],
            ),
          )
        ],
      ),
    );
  }
}

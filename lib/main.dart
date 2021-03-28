import 'package:flutter/material.dart';
import 'package:sample_flutter_project/services/service_locator.dart';
import 'package:sample_flutter_project/ui/views/core/landing.dart';
import 'package:sample_flutter_project/ui/views/login/login_page.dart';

void main() {
  setupService();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Landing(),
    );
  }
}

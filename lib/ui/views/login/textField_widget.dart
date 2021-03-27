import 'package:flutter/material.dart';

class MyCustomTextField extends StatelessWidget {
  final String labelText;
  MyCustomTextField(this.labelText);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      width: 300.0,
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
            borderSide: BorderSide(color: Colors.grey[200]),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
            borderSide: BorderSide(color: Colors.grey[200]),
          ),
        ),
      ),
    );
  }
}

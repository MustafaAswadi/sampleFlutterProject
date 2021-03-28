import 'package:flutter/material.dart';

class MyCustomTextField extends StatelessWidget {
  String text;

  final String labelText;
  MyCustomTextField(this.labelText, this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      width: 300.0,
      child: TextField(
        onSubmitted: (value) {
          text = value;
        },
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

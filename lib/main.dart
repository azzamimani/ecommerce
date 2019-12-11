import 'package:ecommerce/pages/login.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent.shade700
      ),
    )
  );
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokeapp/pages/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PokeApp",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
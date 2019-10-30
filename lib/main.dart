import 'package:flutter/material.dart';
import 'package:tugas3/pages/detail.dart';
import 'pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jenis Olahraga",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        fontFamily: 'Comfortaa',
      ),
      home: HomePage(),
      routes: {
        DetailPage.routeName: (context) => DetailPage(),
      },
    );
  }
}

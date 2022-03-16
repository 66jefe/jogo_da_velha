import 'package:flutter/material.dart';

import 'home/home_view.dart';

class AppWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
  
}
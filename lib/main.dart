
import 'package:flutter/material.dart';

import 'package:news/screens/home/home.dart';
import 'package:news/screens/news_details/newsDetials.dart';
import 'package:news/screens/tabs/categories/categories_tab.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     routes: {Home.routeName:(_)=>Home(),
       NewsDetails.routeName:(_)=>NewsDetails()
     },
      initialRoute: Home.routeName,
    );

  }


  void getArticle(){

  }
}

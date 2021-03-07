import 'package:android_online_store/Screen/about_me.dart';
import 'package:android_online_store/Screen/landing.dart';
import 'package:android_online_store/componets/auth_test.dart';
import 'package:android_online_store/componets/catalog.dart';
import 'package:android_online_store/componets/categories.dart';
import 'package:provider/provider.dart';

import 'Screen/home.dart';
import 'file:///C:/Users/USER/AndroidStudioProjects/android_online_store/lib/Screen/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDataProvider>(
          create: (context) => ProductDataProvider(),
        ),
        ChangeNotifierProvider<ProductDataProvider1>(
          create: (context) => ProductDataProvider1(),
        ),
        // ChangeNotifierProvider<CartDataProvider>(
        //   create: (context) => CartDataProvider(),
        // ),
      ],
      child: MaterialApp(
        title: 'Менялка',
          theme: ThemeData(
          primarySwatch: Colors.orange,
          textTheme: TextTheme(
          title: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.white,
        ),
        //home:  AboutMe(),
        home: LandingPage(),
        // home: MyApp1(),
      ),
    );
  }
}

class MyHomePage12 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My work'),
        leading: Icon(Icons.insert_emoticon),
      ),
      body: Card(
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(bottom: 80),
            width: 300,
            height: 300,
            child: Image.network('https://image.freepik.com/free-vector/online-shopping-banner_82574-3393.jpg')
          ),
        ),
      ),
    );
  }
}

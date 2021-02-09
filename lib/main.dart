import 'package:android_online_store/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: TextTheme(
        title: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.white,
      ),
      home: AuthorrizationPageState(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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

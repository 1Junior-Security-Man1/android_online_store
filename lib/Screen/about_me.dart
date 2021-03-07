import 'package:android_online_store/Screen/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'О себе',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white, size: 90),
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => AuthorrizationPageState()),
              );
            }),
      ),
      body: AboutM(),
    );
  }
}

class AboutM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      height: 220,
      width: 370,
      color: Colors.orange,
      //padding: EdgeInsets.only(right: 220, top: 10),
      child: Column(
        children: [
          GestureDetector(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 230, top: 40),
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://www.zastavki.com/pictures/1920x1200/2011/Animals_Cats_Cat_in_the_glasses_032992_.jpg'),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment(-0.85,0),
                  //padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Мистер Твистер',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                //Divider(color: Colors.black,),
                Container(
                  alignment: Alignment(-0.97,0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                        'home@dartflutter.com',
                        style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

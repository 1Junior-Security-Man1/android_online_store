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
      ),
      body: AboutM(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.orange),
                // margin: EdgeInsets.only(right: 15),
                accountName: Text('Мистер Твистер'),
                accountEmail: Text("home@dartflutter.ru"),
                currentAccountPicture: Container(
                  margin: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.network(
                          'https://www.zastavki.com/pictures/1920x1200/2011/Animals_Cats_Cat_in_the_glasses_032992_.jpg')
                          .image,
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                title: Text("Смена пользовотеля"),
                leading: Icon(Icons.supervised_user_circle),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => AuthorrizationPageState()),
                  );
                }),
            ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                title: Text("О себе"),
                leading: Icon(Icons.account_box),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AboutMe()),
                  );
                }),
            ListTile(
                title: Text("Настройки"),
                leading: Icon(Icons.settings),
                contentPadding: EdgeInsets.only(left: 10),
                onTap: () {}),
            ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                title: Text("Выход"),
                leading: Icon(Icons.exit_to_app),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => AuthorrizationPageState()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class AboutM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 23, top: 20),
      height: 220,
      width: 370,
      color: Colors.orange,
      padding: EdgeInsets.only(right: 220, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10,),
                  width: 130,
                  height: 130,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://www.zastavki.com/pictures/1920x1200/2011/Animals_Cats_Cat_in_the_glasses_032992_.jpg'),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Text('Мистер Твистер', style: TextStyle(fontSize: 16, color: Colors.black),),
                ),
                //Divider(color: Colors.black,),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text('home@dartflutter.ru', style: TextStyle(fontSize: 15, color: Colors.black),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

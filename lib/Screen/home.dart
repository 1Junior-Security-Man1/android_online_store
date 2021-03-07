import 'package:android_online_store/Screen/about_me.dart';
import 'package:android_online_store/Screen/auth.dart';
import 'package:android_online_store/componets/active_workouts.dart';
import 'package:android_online_store/componets/saved_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Менялка',
          style: TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white, size: 90),
        actions: [
          FlatButton.icon(
            icon: Icon(
              Icons.search,
              size: 27,
              color: Colors.white,
            ),
            label: SizedBox.shrink(),
          ),
        ],
      ),
      body: sectionIndex == 0 ? ActiveWorkouts() : SavedScreen(),
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
                title: Text("Баланс"),
                leading: Icon(Icons.monetization_on),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      // Временно
                        builder: (context) => AuthorrizationPageState()),
                  );
                }),
            ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                title: Text("О себе"),
                leading: Icon(Icons.account_box),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => AboutMe()),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black54,
              size: 28,
            ),
            title: Text(
              'home',
              style: TextStyle(color: Colors.black54, fontSize: 17),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.black54,
              size: 27,
            ),
            title: Text(
              'love',
              style: TextStyle(color: Colors.black54, fontSize: 17),
            ),
          ),
        ],
        currentIndex: sectionIndex,
        selectedItemColor: Colors.white,
        onTap: (int index) {
          setState(() {
            sectionIndex = index;
          });
        },
      ),
    );
  }
}

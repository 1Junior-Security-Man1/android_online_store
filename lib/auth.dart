import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorrizationPageState extends StatefulWidget {
  @override
  _AuthorrizationPageStateState createState() =>
      _AuthorrizationPageStateState();
}

class _AuthorrizationPageStateState extends State<AuthorrizationPageState> {
  TextEditingController _emaleController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 70),
        child: Container(
          child: Align(
            child: Text('FIT-TREK',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    color: Colors.black)),
          ),
        ),
      );
    }

    Widget _input(String hint, TextEditingController controller, bool obs) {
      return Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: TextField(
          controller: controller,
          obscureText: obs,
          style: TextStyle(fontSize: 20, color: Colors.black),
          decoration: InputDecoration(
            hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black12),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange, width: 3),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange, width: 1),
            ),
            prefix: Padding(
              padding: EdgeInsets.only(left: 10),
            ),
            // prefixIcon: Padding(
            //   padding: EdgeInsets.only(left: ),
            // ),
          ),
        ),
      );
    }

    Widget _form(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            //Заголовок - Поля
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
                top: 10,
              ),
              child: _input('Username', _emaleController, false),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: _input('Password', _passwordController, true),
            ),
            //Поля - кнопки
            SizedBox(
              height: 100,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Регистрация/Вход',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        //Цвет сендвича
        iconTheme: IconThemeData(color: Colors.white),
        // leading: Icon(
        //   Icons.menu,
        //   size: 28,
        //   color: Colors.white,
        // ),
        // actions: [
        //   FlatButton.icon(
        //     icon: Icon(
        //       Icons.more_vert,
        //       size: 27,
        //       color: Colors.white,
        //     ),
        //     label: SizedBox.shrink(),
        //   ),
        // ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _logo(),
          _form('', () {}),
          Container(
            color: Color(0xffff9800),
            height: 50,
            width: 300,
            child: Column(
              children: <Widget>[
                MaterialButton(
                  color: Color(0xffff9800),
                  child: Text(
                    'Войти',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  onPressed: null,
                ),
              ],
            ),
          ),
          //Кнопки
          SizedBox(
            height: 13,
          ),
          Container(
            color: Color(0xffff9800),
            height: 50,
            width: 300,
            child: Column(
              children: <Widget>[
                MaterialButton(
                  color: Color(0xffff9800),
                  child: Text(
                    'Регестрация',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  onPressed: null,
                ),
              ],
            ),
          ),
        ],
      ),
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
                  decoration: BoxDecoration(
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
                onTap: () {}),
            ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                title: Text("О себе"),
                leading: Icon(Icons.account_box),
                onTap: () {}),
            ListTile(
                title: Text("Настройки"),
                leading: Icon(Icons.settings),
                contentPadding: EdgeInsets.only(left: 10),
                onTap: () {}),
            ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                title: Text("Выход"),
                leading: Icon(Icons.exit_to_app),
                onTap: () {}),
          ],
        ),
      ),
    );
    // Widget _button() {
    //   return Container(
    //     child: Text(''),
    //   );
    // }
  }
}

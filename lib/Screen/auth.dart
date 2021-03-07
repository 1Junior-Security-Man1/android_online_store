import 'package:android_online_store/Screen/about_me.dart';
import 'package:android_online_store/Screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthorrizationPageState extends StatefulWidget {
  @override
  _AuthorrizationPageStateState createState() =>
      _AuthorrizationPageStateState();
}

class _AuthorrizationPageStateState extends State<AuthorrizationPageState> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emaleController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;

  // void auth()async{
  //   FirebaseAuth.instance
  //       .authStateChanges()
  //       .listen((User user) {
  //     if (user == null) {
  //       print('Пользователь в настоящее время вышел из системы!');
  //     } else {
  //       print('User is signed in!');
  //     }
  //   });
  // }

  void _signInWithEmailAndPassword() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final User user = (await _auth.signInWithEmailAndPassword(
      email: _emaleController.text,
      password: _passwordController.text,
    )).user;
    if (user != null) {
      setState(() {
        Navigator.of(context).push(
          MaterialPageRoute(
            //ВРЕМЕННО!!!
              builder: (context) => HomePage()),
        );
        _success = true;
        _userEmail = user.email;
      });
    } else {
      _emaleController.clear();
      _passwordController.clear();
      setState(() {
        _success = false;
      });
    }
    _emaleController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 70),
        child: Container(
          child: Align(
            child: Text('CHANGER',
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
          ),
        ),
      );
    }

    Widget _form(void func()) {
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
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                _success == null
                    ? ''
                    : (_success
                    ? 'Successfully signed in ' + _userEmail
                    : 'Sign in failed'),
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      );
    }

    void _register() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      final User user = (await
      _auth.createUserWithEmailAndPassword(
        email: _emaleController.text,
        password: _passwordController.text,
      )
      ).user;
      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email;
        });
      } else {
        _emaleController.clear();
        _passwordController.clear();
        setState(() {
          _success = true;
        });
      }
      _emaleController.clear();
      _passwordController.clear();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Регистрация/Вход',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        //Цвет сендвича
        iconTheme: IconThemeData(color: Colors.white, size: 90),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _logo(),
          _form(_signInWithEmailAndPassword),
          Column(
            children: <Widget>[
              /// Начало
              Container(
                padding: const EdgeInsets.only(top: 150),
                child: Column(
                  children: [
                    MaterialButton(
                      height: 50,
                      minWidth: 300,
                      color: Color(0xffff9800),
                      child: Text(
                        'Войти',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      onPressed: () async {
                        _signInWithEmailAndPassword();
                      },
                    ),
                  ],
                ),
              ),
              /// раздел
            ],
          ),
          //Кнопки
          SizedBox(
            height: 15,
          ),
          Column(
            children: <Widget>[
              // TODO сдеать
              Container(
                //key: _formKey,
                child: Column(
                  children: [
                    MaterialButton(
                      height: 50,
                      minWidth: 300,
                      color: Color(0xffff9800),
                      child: Text(
                        'Регистрация',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      // TODO исправить
                      onPressed: () async {
                        _register();
                      },
                    ),
                  ],
                ),
                //padding: const EdgeInsets.only(bottom: 14),
              ),
            ],
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
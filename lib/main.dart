import 'package:erp/db/dao/person_dao.dart';
import 'package:erp/util/preferences/preferences.dart';
import 'package:flutter/material.dart';

import 'view/user_list.dart';
import 'view/login_page.dart';
import 'view/reg_page.dart';
import 'package:erp/view/home_page.dart';
import 'package:erp/view/home.dart';
import 'db/database.dart';
//void main()  => runApp(MyApp());

//flutter packages pub run build_runner build

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(personDao: database.personDao),
    HomePage.tag: (context) => HomePage(),
    RegPage.tag: (context) => RegPage(personDao: database.personDao),
    'Home': (context) => Home(personDao: database.personDao),
    'Users': (context) => UserList(personDao: database.personDao),
  };

  getLogin(){
    var retVal = null;
    Prefs.username.then((value) {
        retVal = value;
    });
    print("LAST : "+retVal.toString());
    if (retVal == null){
      Prefs.clear();
      return LoginPage(personDao: database.personDao);
    } else {
      return Home(personDao: database.personDao);
    }
  }

  runApp(MaterialApp(
    title: 'Kodeversitas',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.lightBlue,
      fontFamily: 'Nunito',
    ),
    home:getLogin(),
    routes: routes,
  ));
//  runApp(MyApp(database.personDao));
}
/*


class MyApp extends StatelessWidget {
  final PersonDao personDao;
  MyApp(this.personDao);
  final  routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    RegPage.tag: (context) => RegPage(),
    'Home': (context) => Home(),
  };





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kodeversitas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}*/

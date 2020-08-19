import 'package:erp/util/preferences/preferences.dart';
import 'package:erp/util/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

import 'package:erp/db/dao/person_dao.dart';
import 'package:erp/view/login_page.dart';
import 'package:geolocator/geolocator.dart';

enum MenuItemType { GENERAL, TANSACTIONS, REPORTS, SETTINGS }

var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];

class Home extends StatelessWidget {
  static String tag = 'home';
  static String user_logged = "N/A";
  final PersonDao personDao;

  const Home({Key key, @required this.personDao}) : super(key: key);

  @override
  void initState() {
    Prefs.username.then((value) {
      user_logged = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: new ListView(
          shrinkWrap: true, //just set this property
          padding: const EdgeInsets.only(top: 0, bottom: 0),
          children: <Widget>[
//            SizedBox(height: 48.0),

            UserAccountsDrawerHeader(
              accountEmail: Text('Epic Lanka(PVT)Ltd.'),
              accountName:
                  Text("Accounting Live", style: TextStyle(fontSize: 18)),
              currentAccountPicture: CircleAvatar(
                backgroundImage: ExactAssetImage('assets/logo.png'),
                backgroundColor: Colors.transparent,
              ),
              margin: const EdgeInsets.only(bottom: 0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Colors.blue[800],
                    Colors.blue[700],
                    Colors.blue[600],
                    Colors.blue[400],
                    Colors.blue[300],
                  ],
                ),
              ),
            ),

            ExpansionTile(
              leading: new Icon(Icons.apps),
              title: Text("General"),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(children: <Widget>[
                        Icon(Icons.trip_origin, size: 15),
                        Text("Master Tables")
                      ])),
                ),
              ],
            ),

            ExpansionTile(
              leading: new Icon(Icons.wc),
              title: Text("Costomer"),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(children: <Widget>[
                        Icon(Icons.trip_origin, size: 15),
                        Text("Invoise")
                      ])),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(children: <Widget>[
                          Icon(Icons.trip_origin, size: 15),
                          Text("Payment")
                        ])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(children: <Widget>[
                          Icon(Icons.trip_origin, size: 15),
                          Text("Performa Invoice")
                        ])),
                  ),
                ),
              ],
            ),

            ExpansionTile(
              leading: new Icon(Icons.wc),
              title: Text("Vendor"),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(children: <Widget>[
                        Icon(Icons.trip_origin, size: 15),
                        Text("Invoise")
                      ])),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(children: <Widget>[
                          Icon(Icons.trip_origin, size: 15),
                          Text("Payment")
                        ])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(children: <Widget>[
                          Icon(Icons.trip_origin, size: 15),
                          Text("Performa Invoice")
                        ])),
                  ),
                ),
              ],
            ),

            ExpansionTile(
              leading: new Icon(Icons.account_balance),
              title: Text("Bank"),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(children: <Widget>[
                        Icon(Icons.trip_origin, size: 15),
                        Text("Invoise")
                      ])),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(children: <Widget>[
                          Icon(Icons.trip_origin, size: 15),
                          Text("Payment")
                        ])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(children: <Widget>[
                          Icon(Icons.trip_origin, size: 15),
                          Text("Performa Invoice")
                        ])),
                  ),
                ),
              ],
            ),

            ExpansionTile(
              leading: new Icon(Icons.assessment),
              title: Text("Reports"),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(children: <Widget>[
                        Icon(Icons.trip_origin, size: 15),
                        Text("Invoise")
                      ])),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(children: <Widget>[
                          Icon(Icons.trip_origin, size: 15),
                          Text("Payment")
                        ])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(children: <Widget>[
                          Icon(Icons.trip_origin, size: 15),
                          Text("Performa Invoice")
                        ])),
                  ),
                ),
              ],
            ),

            ExpansionTile(
              leading: new Icon(Icons.settings),
              title: Text("Settings"),
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                        Navigator.of(context).pushNamed("Users");
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(children: <Widget>[
                            Icon(Icons.trip_origin, size: 15),
                            Text("User")
                          ])),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(children: <Widget>[
                          Icon(Icons.trip_origin, size: 15),
                          Text("Lable")
                        ])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(children: <Widget>[
                          Icon(Icons.trip_origin, size: 15),
                          Text("Serial")
                        ])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(children: <Widget>[
                          Icon(Icons.trip_origin, size: 15),
                          Text("Host")
                        ])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(children: <Widget>[
                          Icon(Icons.trip_origin, size: 15),
                          Text("Backup & Restore")
                        ])),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          toastPrimary("Can't go back, Please logout");
          Future.value(
              false); //return a `Future` with false value so this route cant be popped or closed.
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
/*              Positioned(
                top: 30,
                left: 10,
                child: Builder(
                  builder: (BuildContext c) => IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () => Scaffold.of(c).openDrawer(),
                  ),
                ),
              ),*/
              Column(
                children: <Widget>[
                  Container(
                    margin:
                        const EdgeInsets.only(top: 30.0, left: 10, right: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Builder(
                          builder: (BuildContext c) => IconButton(
                            icon: Icon(
                              Icons.menu,
                              size: 30,
                              color: Colors.white,
                            ),
                            onPressed: () => Scaffold.of(c).openDrawer(),
                          ),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Row(children: <Widget>[
                              Icon(
                                Icons.person,
                                size: 15,
                                color: Colors.amberAccent,
                              ),
                              Text(
                                user_logged,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Colors.amberAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              PopupMenuButton<String>(
                                color: Colors.white,
                                icon:
                                    Icon(Icons.more_vert, color: Colors.white),
                                onSelected: (value) {
                                  if (value == Constants.Settings) {
                                    toastPrimary('Settings');
                                  } else if (value == Constants.Subscribe) {
                                    toastPrimary('Subscribe');
                                  } else if (value == Constants.SignOut) {
                                    Prefs.clear();
                                    Navigator.of(context)
                                        .pushNamed(LoginPage.tag);
                                  }
                                },
                                itemBuilder: (BuildContext context) {
                                  return Constants.choices.map((String choice) {
                                    return PopupMenuItem<String>(
                                        value: choice,
                                        child: Text(choice,
                                            style: TextStyle(
                                                fontSize: 9,
                                                fontStyle: FontStyle.italic)));
                                  }).toList();
                                },
                              ),
                            ])),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(left: 0, right: 0),
                          width: MediaQuery.of(context).size.width / 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white70,
                              elevation: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                      leading: Icon(Icons.home, size: 40),
                                      title: Text('Company',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14)),
                                      subtitle: Text('90%',
                                          style:
                                              TextStyle(color: Colors.white))),

                                  /*ButtonTheme.bar(
                                  child: ButtonBar(
                                    children: <Widget>[
                                      FlatButton(
                                        child: const Text('Edit', style: TextStyle(color: Colors.white)),
                                        onPressed: () {},
                                      ),
                                      FlatButton(
                                        child: const Text('Delete', style: TextStyle(color: Colors.white)),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),*/
                                ],
                              ),
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(left: 0, right: 0),
                          width: MediaQuery.of(context).size.width / 2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, right: 20),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white70,
                              elevation: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                      leading: Icon(Icons.wc, size: 40),
                                      title: Text('Customers',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14)),
                                      subtitle: Text('90%',
                                          style:
                                              TextStyle(color: Colors.white))),

                                  /*ButtonTheme.bar(
                                  child: ButtonBar(
                                    children: <Widget>[
                                      FlatButton(
                                        child: const Text('Edit', style: TextStyle(color: Colors.white)),
                                        onPressed: () {},
                                      ),
                                      FlatButton(
                                        child: const Text('Delete', style: TextStyle(color: Colors.white)),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),*/
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(left: 0, right: 0),
                          width: MediaQuery.of(context).size.width / 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white70,
                              elevation: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                      leading: Icon(Icons.wc, size: 40),
                                      title: Text('Vendors',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14)),
                                      subtitle: Text('90%',
                                          style:
                                              TextStyle(color: Colors.white))),

                                  /*ButtonTheme.bar(
                                  child: ButtonBar(
                                    children: <Widget>[
                                      FlatButton(
                                        child: const Text('Edit', style: TextStyle(color: Colors.white)),
                                        onPressed: () {},
                                      ),
                                      FlatButton(
                                        child: const Text('Delete', style: TextStyle(color: Colors.white)),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),*/
                                ],
                              ),
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(left: 0, right: 0),
                          width: MediaQuery.of(context).size.width / 2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, right: 20),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white70,
                              elevation: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                      leading: Icon(Icons.person, size: 40),
                                      title: Text('Account',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14)),
                                      subtitle: Text('90%',
                                          style:
                                              TextStyle(color: Colors.white))),

                                  /*ButtonTheme.bar(
                                  child: ButtonBar(
                                    children: <Widget>[
                                      FlatButton(
                                        child: const Text('Edit', style: TextStyle(color: Colors.white)),
                                        onPressed: () {},
                                      ),
                                      FlatButton(
                                        child: const Text('Delete', style: TextStyle(color: Colors.white)),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),*/
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 0, right: 0),
                      //width: 200,
                      height: 200,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 10, right: 20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.white70,
                          elevation: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const ListTile(
                                  leading: Icon(Icons.wc, size: 40),
                                  title: Text('Vendors',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14)),
                                  subtitle: Text('90%',
                                      style: TextStyle(color: Colors.white))),
                              new Sparkline(
                                data: data,
                                pointsMode: PointsMode.all,
                                pointSize: 8.0,
                                pointColor: Colors.amber,
//                                fillMode: FillMode.below,
//                                fillColor: Colors.white,
                              ),
                              /*ButtonTheme.bar(
                                  child: ButtonBar(
                                    children: <Widget>[
                                      FlatButton(
                                        child: const Text('Edit', style: TextStyle(color: Colors.white)),
                                        onPressed: () {},
                                      ),
                                      FlatButton(
                                        child: const Text('Delete', style: TextStyle(color: Colors.white)),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),*/
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 16,
                                ),
                                child: Text(
                                  "ffff",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Pacifico',)
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.blue[800],
                Colors.blue[700],
                Colors.blue[600],
                Colors.blue[400],
                Colors.blue[300],
              ],
            ),
          ),
        ),
      ),

      /* Container(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) => EntryItem(
            data[index],
          ),
        ),
      )*/
    );
  }
}

class Constants {
  static const String Subscribe = 'Subscribe';
  static const String Settings = 'Settings';
  static const String SignOut = 'Sign out';

  static const List<String> choices = <String>[Subscribe, Settings, SignOut];
}

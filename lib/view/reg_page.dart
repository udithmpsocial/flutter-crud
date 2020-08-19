import 'package:erp/db/dao/person_dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_page.dart';
import 'package:erp/db/entity/person.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../util/toast.dart';
import '../util/formatter.dart';
import 'package:erp/util/location.dart';

class RegPage extends StatefulWidget {
  static String tag = 'reg-page';
  final PersonDao personDao;


  const RegPage({Key key, @required this.personDao}) : super(key: key);

  @override
  _RegPageState createState() => new _RegPageState(personDao);
}

class _RegPageState extends State<RegPage> {
  final PersonDao personDao;

  _RegPageState(this.personDao);

  @override
  void initState() {
    addressTxt.text = Gps.address.toString();
  }

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  var nicTxt = TextEditingController();
  var nicTpeTxt = TextEditingController();
  var fnameTxt = TextEditingController();
  var lnameTxt = TextEditingController();
  var addressTxt = TextEditingController();
  var tpTxt = TextEditingController();
  var unTxt = TextEditingController();
  var pwTxt = TextEditingController();

  bool _isLastLocation = true;

  getAddress() {
    Gps gps = new Gps();
  }

  int saveUser(String fname, String lname, String address, String nic,
      String tp, String un, String pw) {
    int retVal = 0;
    Person person = new Person(
        null, serialFormat(1), fname, lname, address, nic, tp, un, pw);

    personDao.insertPerson(person).then((value) {
      retVal = value;
    });
    return retVal;
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Sign in',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body:

          /*  Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            Row(children: <Widget>[forgotLabel],),

          ],
        ),
      ),*/

          Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Hero(
              tag: 'hero',
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 48.0,
                child: Image.asset('assets/logo.png'),
              ),
            ),
            SizedBox(height: 48.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    autofocus: false,
//                    initialValue: '',
                    controller: fnameTxt,
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    autofocus: false,
//                    initialValue: '',
                    controller: lnameTxt,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    maxLines: 5,
//                    obscureText: _obscureText,
                    keyboardType: TextInputType.text,
                    autofocus: false,
//                    initialValue: '',
                    onTap: () {
                      addressTxt.text = Gps.address.toString();
                    },
                    controller: addressTxt,
                    decoration: InputDecoration(
                      hintText: 'Address',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            Gps.initLastKnownLocation();
                            Gps.initAddress(Gps.position_last);
                            addressTxt.text = Gps.address.toString();
                            _isLastLocation = !_isLastLocation;
                          });
                        },
                        child: Icon(
                          _isLastLocation
                              ? Icons.add_location
                              : Icons.not_listed_location,
                          semanticLabel: _isLastLocation
                              ? 'Your last location'
                              : 'Your current location',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    autofocus: false,
//                    initialValue: '',
                    controller: nicTxt,
                    decoration: InputDecoration(
                      hintText: 'NIC',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 8,
                  child: TextFormField(
                    readOnly: true,
                    onTap: () {
                      if (nicTpeTxt.text == "") {
                        nicTpeTxt.text = "V";
                      } else if (nicTpeTxt.text == "V") {
                        nicTpeTxt.text = "X";
                      } else if (nicTpeTxt.text == "X") {
                        nicTpeTxt.text = "V";
                      }
                      print("" + nicTpeTxt.text);
                    },
                    controller: nicTpeTxt,
                    onChanged: (String val) {
                      setState(() {
                        nicTpeTxt.text = val;
                      });
                    },
                    textAlign: TextAlign.justify,
//                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'X/V',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    autofocus: false,
//                    initialValue: '',
                    controller: tpTxt,
                    decoration: InputDecoration(
                      hintText: 'Telephone Number',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    autofocus: false,
//                    initialValue: '',
                    controller: unTxt,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    autofocus: false,
//                    initialValue: '',
                    controller: pwTxt,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                onPressed: () {
                  saveUser(
                              fnameTxt.text,
                              lnameTxt.text,
                              addressTxt.text,
                              nicTxt.text + nicTpeTxt.text,
                              tpTxt.text,
                              unTxt.text,
                              pwTxt.text) >
                          0
                      ? Navigator.of(context).pushNamed(LoginPage.tag)
                      : toastDefault("Sign up completed");
                  Navigator.of(context).pushNamed(LoginPage.tag);
                },
                padding: EdgeInsets.only(top: 15, bottom: 15),
                color: Colors.lightBlueAccent,
                child: Text('Sign Up', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

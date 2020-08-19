import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastDefault(String str) {
Fluttertoast.showToast(
msg: ""+str,
toastLength: Toast.LENGTH_SHORT,
gravity: ToastGravity.BOTTOM,
timeInSecForIos: 1,
backgroundColor: Colors.grey,
textColor: Colors.white,
fontSize: 16.0
);
}

void toastPrimary(String str) {
Fluttertoast.showToast(
msg: ""+str,
toastLength: Toast.LENGTH_SHORT,
gravity: ToastGravity.BOTTOM,
timeInSecForIos: 1,
backgroundColor: Colors.blue,
textColor: Colors.white,
fontSize: 16.0
);
}

void toastSuccess(String str) {
Fluttertoast.showToast(
msg: ""+str,
toastLength: Toast.LENGTH_SHORT,
gravity: ToastGravity.BOTTOM,
timeInSecForIos: 1,
backgroundColor: Colors.green,
textColor: Colors.white,
fontSize: 16.0
);
}


void toastWarnning(String str) {
Fluttertoast.showToast(
msg: ""+str,
toastLength: Toast.LENGTH_SHORT,
gravity: ToastGravity.BOTTOM,
timeInSecForIos: 1,
backgroundColor: Colors.yellow,
textColor: Colors.white,
fontSize: 16.0
);
}


void toastDanger(String str) {
Fluttertoast.showToast(
msg: ""+str,
toastLength: Toast.LENGTH_SHORT,
gravity: ToastGravity.BOTTOM,
timeInSecForIos: 1,
backgroundColor: Colors.red,
textColor: Colors.white,
fontSize: 16.0
);
}

import 'package:intl/intl.dart';

String serialFormat(int id) {return id.toString().padLeft(4, '0');}
String dateFormat(int date) {final f = new DateFormat('yyyy-MM-dd hh:mm'); f.format(new DateTime.fromMillisecondsSinceEpoch(date*1000));}

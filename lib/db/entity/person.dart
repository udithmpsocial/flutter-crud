import 'package:floor/floor.dart';

@entity
class Person {

  @PrimaryKey(autoGenerate: true)
   final int id;
   final String serial;
   final String fname;
   final String lname;
   final String address;
   final String nic;
   final String tp;
   final String un;
   final String pw;


  Person(
      this.id,
      this.serial,
      this.fname,
      this.lname,
      this.address,
      this.nic,
      this.tp,
      this.un,
      this.pw,
      );


}
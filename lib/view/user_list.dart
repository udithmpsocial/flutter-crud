import 'package:erp/db/entity/person.dart';
import 'package:erp/util/toast.dart';
import 'package:flutter/material.dart';

import '../db/dao/person_dao.dart';

class UserList extends StatefulWidget {
//  UserList() : super();

  final String title = "User List";

  final PersonDao personDao;

  const UserList({Key key, @required this.personDao}) : super(key: key);

  @override
  UserListState createState() => UserListState(personDao);
}

class UserListState extends State<UserList> {
  bool sort;
  List<Person> personList = [];
  List<Person> personSelectedList = [];
  List<Person> personListOriginal = [];
  List<Person> personListFilters = [];
  final PersonDao personDao;

  var srchTxt = TextEditingController();

  UserListState(this.personDao);

  @override
  void initState() {
    sort = false;
    getPersons();
    super.initState();
  }

  Future<String> _asyncInputDialog(
      BuildContext context_, Person personSelected) async {
    var nicTxt = TextEditingController();
    nicTxt.text = personSelected.nic;
    var fnameTxt = TextEditingController();
    fnameTxt.text = personSelected.fname;
    var lnameTxt = TextEditingController();
    lnameTxt.text = personSelected.lname;
    var addressTxt = TextEditingController();
    addressTxt.text = personSelected.address;
    var tpTxt = TextEditingController();
    tpTxt.text = personSelected.tp;
    var unTxt = TextEditingController();
    unTxt.text = personSelected.un;
    var pwTxt = TextEditingController();
    pwTxt.text = personSelected.pw;
    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update : ' + personSelected.id.toString()),
          content: SingleChildScrollView(
            // won't be scrollable
            child: new Wrap(
//            mainAxisSize: MainAxisSize.min,
//            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new TextField(
                      controller: fnameTxt,
                      autofocus: false,
                      decoration: new InputDecoration(
                          labelText: 'F Name', hintText: ''),
                      onChanged: (value) {
//                        teamName = value;
                      },
                    )),
                    SizedBox(width: 5),
                    new Expanded(
                        child: new TextField(
                      controller: lnameTxt,
                      autofocus: false,
                      decoration: new InputDecoration(
                          labelText: 'L Name', hintText: ''),
                      onChanged: (value) {},
                    ))
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new TextField(
                      autofocus: false,
                      decoration: new InputDecoration(
                          labelText: 'Address', hintText: ''),
                      onChanged: (value) {},
                    )),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new TextField(
                      controller: nicTxt,
                      autofocus: false,
                      decoration:
                          new InputDecoration(labelText: 'NIC', hintText: ''),
                      onChanged: (value) {},
                    )),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new TextField(
                      controller: tpTxt,
                      autofocus: false,
                      decoration: new InputDecoration(
                          labelText: 'Telephone No', hintText: ''),
                      onChanged: (value) {},
                    )),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new TextField(
                      controller: unTxt,
                      autofocus: false,
                      decoration: new InputDecoration(
                          labelText: 'Username', hintText: ''),
                      onChanged: (value) {},
                    )),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new TextField(
                      controller: pwTxt,
                      autofocus: false,
                      decoration: new InputDecoration(
                          labelText: 'Password', hintText: ''),
                      onChanged: (value) {},
                    )),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[

          ],
        );
      },
    );
  }

  getSearch(String str) async {
    setState(() {
      personListFilters.clear();
      if (!str.trim().isEmpty) {
        print(str);
        personListOriginal.forEach((person) {
          print("Filterd Size : " + person.id.toString());

          if (person.fname.contains(str) ||
              person.lname.contains(str) ||
              person.address.contains(str) ||
              person.nic.contains(str) ||
              person.tp.contains(str) ||
              person.un.contains(str) ||
              person.pw.contains(str)) {
            personListFilters.add(person);
          }
          ;
        });
        print("Filterd Size : " + personListFilters.length.toString());

        personList = personListFilters;
      } else {
        personList = personListOriginal;
      }
    });
  }

  getPersons() async {
    personDao.findAllPersons().then((value) {
      setState(() {
        personList = value;
        personListOriginal = personList;
      });
    });
  }

  Future<int> updatePersons(Person person) async {
    personDao.updatePerson(person).then((value) {
      setState(() {
        getPersons();
        return value;
      });
    });
  }

  Future<int> deletePersons(Person person) async {
    personDao.removePerson(person).then((value) {
      setState(() {
        getPersons();
        return value;
      });
    });
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 1) {
      if (ascending) {
        personList.sort((a, b) => a.fname.compareTo(b.fname));
      } else {
        personList.sort((a, b) => b.fname.compareTo(a.fname));
      }
    }
  }

  onSelectedRow(bool selected, Person person) async {
    setState(() {
      if (selected) {
        personSelectedList.add(person);
      } else {
        personSelectedList.remove(person);
      }
    });
  }

  deleteSelected() async {
    setState(() {
      if (personSelectedList.isNotEmpty) {
        List<Person> temp = [];
        temp.addAll(personSelectedList);
       for (Person person in temp) {
          print("Delete : " + person.id.toString());
          if (deletePersons(person) != null) {
            toastSuccess("Delete Successfully Completed");
            personList.remove(person);
            personSelectedList.remove(person);
          } else {
            toastDanger("Delete Failed");
          }
        }
      }
    });
  }

  SingleChildScrollView dataBody(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            sortAscending: sort,
            sortColumnIndex: 1,
            columns: [
              DataColumn(
                label: Text("ID"),
                numeric: true,
                tooltip: "This is First Name",
              ),
              DataColumn(
                label: Text("SERIAL"),
                numeric: true,
                tooltip: "This is First Name",
              ),
              DataColumn(
                  label: Text("FIRST NAME"),
                  numeric: false,
                  tooltip: "This is First Name",
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      sort = !sort;
                    });
                    onSortColum(columnIndex, ascending);
                  }),
              DataColumn(
                label: Text("LAST NAME"),
                numeric: false,
                tooltip: "This is Last Name",
              ),
              DataColumn(
                label: Text("ADDRESS"),
                numeric: false,
                tooltip: "This is Last Name",
              ),
              DataColumn(
                label: Text("NIC"),
                numeric: false,
                tooltip: "This is Last Name",
              ),
              DataColumn(
                label: Text("TP"),
                numeric: false,
                tooltip: "This is Last Name",
              ),
              DataColumn(
                label: Text("UN"),
                numeric: false,
                tooltip: "This is Last Name",
              ),
              DataColumn(
                label: Text("PW"),
                numeric: false,
                tooltip: "This is Last Name",
              ),
            ],
            rows: personList
                .map(
                  (person) => DataRow(
                      selected: personSelectedList.contains(person),
                      onSelectChanged: (b) {
                        print("Onselect");

                        onSelectedRow(b, person);
                      },
                      cells: [
                        DataCell(
                          Text(person.id.toString()),
                          onTap: () {
                            _asyncInputDialog(context, person);
                            print('Selected ${person.id.toString()}');
                          },
                        ),
                        DataCell(
                          Text(person.serial.toString()),
                          onTap: () {
                            print('Selected ${person.serial.toString()}');
                          },
                        ),
                        DataCell(
                          Text(person.fname),
                          onTap: () {
                            print('Selected ${person.fname}');
                          },
                        ),
                        DataCell(
                          Text(person.lname),
                        ),
                        DataCell(
                          Text(person.address),
                        ),
                        DataCell(
                          Text(person.nic),
                        ),
                        DataCell(
                          Text(person.tp),
                        ),
                        DataCell(
                          Text(person.un),
                        ),
                        DataCell(
                          Text(person.pw),
                        )
                      ]),
                )
                .toList(),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
            child: dataBody(context),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child:
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
//                    initialValue: '',
                        controller: srchTxt,
                        onChanged: (value) {
                          getSearch(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                    ),

              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: OutlineButton(
                  child: Text('REFRESH'),
                  onPressed: () {
                    getPersons();
                  },
                ),
              ),
              Expanded(
                child: OutlineButton(
                  child: Text('SELECTED ${personSelectedList.length}'),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: OutlineButton(
                  child: Text('DELETE SELECTED ( ${personSelectedList.length} )'),
                  onPressed: personSelectedList.isEmpty
                      ? null
                      : () {
                          deleteSelected();
                        },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

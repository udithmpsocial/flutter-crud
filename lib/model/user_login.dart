class UserLogin{
  String _username;
  String _password;
  String _token;
  String _string;


  UserLogin();

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  String get password => _password;

  String get string => _string;

  set string(String value) {
    _string = value;
  }

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  set password(String value) {
    _password = value;
  }


}
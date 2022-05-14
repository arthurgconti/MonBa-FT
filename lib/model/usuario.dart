class User {
  String _name = '',
      _ra = '',
      _email = '',
      _cellphone = '',
      _username = '',
      _password = '';

  String get getName => _name;
  String get getRa => _ra;
  String get getEmail => _email;
  String get getcellphone => _cellphone;
  String get getUsername => _username;
  String get getPassword => _password;

  set setName(name) {
    _name = name;
  }

  set setRa(ra) {
    _ra = ra;
  }

  set setEmail(email) {
    _email = email;
  }

  set setcellphone(cellphone) {
    _cellphone = cellphone;
  }

  set setUsername(username) {
    _username = username;
  }

  set setPassword(password) {
    _password = password;
  }

  User(name, ra, email, cellphone, username, password) {
    _name = name;
    _ra = ra;
    _email = email;
    _cellphone = cellphone;
    _username = username;
    _password = password;
  }
}

class UserCredentials {
  String _email;
  String _password;

  UserCredentials(this._email, this._password);

  UserCredentials.map(dynamic obj) {
    this._email = obj['email'];
    this._password = obj['password'];
  }

  String get email => _email;
  String get password => _password;
}
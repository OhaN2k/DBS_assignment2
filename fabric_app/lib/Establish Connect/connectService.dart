import 'package:mysql1/mysql1.dart';

class Service {
  static var conn;
  String username;
  String password;
  Service(this.username, this.password);
  Future connect() async {
    //TODO: implement backend here
    // This is connecting to the MySQL database(must include this section).
    try {
      conn = await MySqlConnection.connect(ConnectionSettings(
        host: '10.0.2.2',
        port: 3306,
        user: username,
        password: password,
        db: 'fabric_database',
      ));
    } catch (error) {
      return error;
    }
    ;
    // conn.close();
  }
}

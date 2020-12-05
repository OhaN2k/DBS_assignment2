import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart' as mysql;

class ManagerView extends StatefulWidget {
  // final String username;
  // final String password;
  const ManagerView();
  @override
  ManagerViewState createState() => ManagerViewState();
}

class ManagerViewState extends State<ManagerView> {
  // ManagerViewState(this)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // address bottom overflow error
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffff8a84),
        title: Text(
          "VIEW REPORT",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(0, 85, 0, 75),
                  child: SizedBox(
                    width: 200,
                    height: 100,
                    child: createServer(),
                  )),
            ],
          )
        ],
      ),
    );
  }

  // _createTable() {
  //   Server.createTable().then((value) {
  //     print(value);
  //     // return value;
  //   });
  // }

  Future checkConnect() async {
    //TODO: implement backend here

    // This is connecting to the MySQL database(must include this section).
    final conn = await mysql.MySqlConnection.connect(mysql.ConnectionSettings(
      host: '10.0.2.2',
      port: 3306,
      user: 'root',
      password: 'password cua root user trong mysql',
      db: 'fabric_database',
    ));

    // Example of inserting tuple into umbala table.
    var result = await conn.query(
        'insert into umbala (name, email, age) values (?, ?, ?)',
        ['Bob', 'bob@bob.com', 25]);

    // Example of retrieving the tuple in  umbala table with id = 2.
    var results =
        await conn.query('select name, email from  umbala where id = ?', [2]);

    //Print the result from above query
    for (var row in results) {
      print('Name: ${row[0]}, email: ${row[1]}');
    }
    await conn.close();
  }

  // Create button
  Widget createServer() {
    return RaisedButton(
        color: Colors.yellow,
        child: Text(
          "Test Query",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          // call backend function
          checkConnect().then((value) {});
        });
  }
}

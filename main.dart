import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class Item {
  String id;
  String name;
  DateTime timestamp;
  Item(this.id, this.name, this.timestamp);
}

class Test {
  String cat_name;
  String color;
  String code;
  String quantity;
  Test(this.cat_name, this.color, this.code, this.quantity);
}

class MainPageState extends State<MainPage> {
  TextEditingController nameController = TextEditingController();
  List<Test> data = [];
  refreshData() async {
    var dataStr = jsonEncode({
      "command": "get_items",
      "name": nameController.text,
    });
    var url = "http://10.0.2.2/fabric_test2/index.php?data=" + dataStr;
    var result = await http.get(url);
    setState(() {
      data.clear();
      var jsonItems = jsonDecode(result.body) as List<dynamic>;
      jsonItems.forEach((test) {
        this.data.add(Test(test['cat_name'] as String, test['color'] as String,
            test['code'] as String, test['quantity'] as String));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              TextField(
                controller: this.nameController,
                decoration: InputDecoration(labelText: "Input"),
              ),
            ],
          ),
          RaisedButton(
            onPressed: refreshData,
            child: Text("Get data"),
          ),
          Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                        onSelectAll: (b) {},
                        sortColumnIndex: 0,
                        sortAscending: true,
                        columns: [
                          DataColumn(
                            label: Text('cat_name'),
                            numeric: false,
                            onSort: (i, ascending) {
                              setState(() {
                                data.sort(
                                    (a, b) => a.cat_name.compareTo(b.cat_name));
                              });
                            },
                          ),
                          DataColumn(label: Text('color')),
                          DataColumn(label: Text('code')),
                          DataColumn(label: Text('quantity')),
                        ],
                        rows: data
                            .map((test) => DataRow(cells: [
                                  DataCell(Text(test.cat_name)),
                                  DataCell(Text(test.color)),
                                  DataCell(Text(test.code)),
                                  DataCell(Text(test.quantity)),
                                ]))
                            .toList()),
                  )))
        ],
      ),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "fabric2",
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

void main() {
  runApp(App());
}

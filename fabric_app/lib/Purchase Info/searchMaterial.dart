import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart' as mysql;
import 'purchase.dart';

class SearchMaterial extends StatefulWidget {
  final List<Purchase> material;

  SearchMaterial({Key key, this.material}) : super(key: key);

  @override
  SearchMaterialState createState() => SearchMaterialState(this.material);
}

class SearchMaterialState extends State<SearchMaterial> {
  List<Purchase> purchases;
  SearchMaterialState(this.purchases);
  String value;
  @override
  void initState() {
    // purchases = Purchase.getPurchases(widget.material).then((error) {
    //   if (error is List) {
    //     return error;
    //   }
    // });
    super.initState();
  }

  InteractiveViewer dataBody(var data) {
    return InteractiveViewer(
      constrained: false,
      child: DataTable(
        columns: [
          // DataColumn(
          //   label: Text("Supplier Name"),
          // ),
          // DataColumn(
          //   label: Text("Phone Number"),
          // ),
          DataColumn(
            label: Text("Purchased Date"),
          ),
          DataColumn(
            label: Text("Quantity"),
          ),
          DataColumn(
            label: Text("Price"),
          ),
        ],
        rows: data
            .map<DataRow>(
              (purchase) => DataRow(cells: [
                // DataCell(
                //   Text(purchase.supName),
                // ),
                // DataCell(
                //   Text(purchase.supPhone),
                // ),
                DataCell(
                  Text('${purchase.proDate.substring(0, 10)}'),
                ),
                DataCell(
                  Text(purchase.quantity),
                ),
                DataCell(
                  Text(purchase.price),
                ),
              ]),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = this.purchases;
    List<dynamic> phonelist = [];
    List<dynamic> list = [];
    phonelist = filterData(data, 'phone');
    list = filterData(data, 'date');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Purchase History",
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Row(children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 10),
              padding: EdgeInsets.only(top: 15),
              height: 50,
              width: 100,
              alignment: Alignment(-1.0, -1.0),
              child: Text(
                'Supplier: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '${data[0].supName}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ]),
          Row(children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 0),
              padding: EdgeInsets.only(top: 0),
              height: 20,
              width: 100,
              alignment: Alignment(-1.0, -1.0),
              child: Text(
                'Phone: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 0), child: phoneList(phonelist))
          ]),
          Expanded(
            child: Center(
              child: dataBody(list),
            ),
          ),
        ],
      ),
    );
  } //);

  Widget phoneList(List<dynamic> phoneList) {
    return DropdownButton<dynamic>(
      hint: Text("  Phone Number"),
      value: value,
      onChanged: (dynamic onValue) {
        setState(() {
          value = onValue;
        });
      },
      items: phoneList.map((dynamic phone) {
        return DropdownMenuItem<dynamic>(
          value: phone,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Text(
                phone,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  filterData(List<dynamic> x, String value) {
    List<dynamic> list = [];
    List<dynamic> dateList = [];
    for (var i = 0; i < x.length; i++) {
      if (value == "phone") list.add(x[i].supPhone);
      if (value == 'date') {
        if (list.isEmpty) {
          list.add(x[i]);
          dateList.add(x[i].proDate.substring(0, 10));
        } else if (!dateList.contains(x[i].proDate.substring(0, 10))) {
          list.add(x[i]);
          dateList.add(x[i].proDate.substring(0, 10));
        }
      }
      ;
    }
    if (value == 'phone') list = list.toSet().toList();
    print(list);
    return list;
  }
}
//}

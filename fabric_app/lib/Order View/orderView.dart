import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart' as mysql;
import 'package:fabric_app/Add Supplier/supplier.dart';
import 'order.dart';
import 'package:intl/intl.dart';

class ListOrderView extends StatefulWidget {
  final List<Order> material;

  ListOrderView({Key key, this.material}) : super(key: key);

  @override
  ListOrderViewState createState() => ListOrderViewState(this.material);
}

class ListOrderViewState extends State<ListOrderView> {
  List<Order> orderlist;
  ListOrderViewState(this.orderlist);
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
          DataColumn(
            label: Text("Code"),
          ),
          DataColumn(
            label: Text("Customer Code"),
          ),
          DataColumn(
            label: Text("Total Price"),
          ),
          DataColumn(
            label: Text("Employee Code"),
          ),
          DataColumn(
            label: Text("Process Date"),
          ),
          DataColumn(
            label: Text("Process Time"),
          ),
        ],
        rows: data
            .map<DataRow>(
              (order) => DataRow(cells: [
                DataCell(
                  Text('${order.code}'),
                ),
                DataCell(
                  Text('${order.cus_code}'),
                ),
                DataCell(
                  Text('${order.total_price.toString()}'),
                ),
                DataCell(
                  Text('${order.emp_code}'),
                ),
                DataCell(
                  Text('${order.pro_date.substring(0, 10)}'),
                ),
                DataCell(
                  Text('${order.pro_time.substring(0, 8)}'),
                ),
              ]),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = this.orderlist;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Category Details",
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
          Expanded(
            child: Center(
              child: dataBody(data),
            ),
          ),
        ],
      ),
    );
  } //);
}

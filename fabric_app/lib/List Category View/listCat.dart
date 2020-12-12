import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart' as mysql;
import 'package:fabric_app/Add Supplier/supplier.dart';
import 'package:fabric_app/List Category Info/category.dart';

class ListCategoryView extends StatefulWidget {
  final List<Category> material;

  ListCategoryView({Key key, this.material}) : super(key: key);

  @override
  ListCategoryViewState createState() => ListCategoryViewState(this.material);
}

class ListCategoryViewState extends State<ListCategoryView> {
  List<Category> catlist;
  ListCategoryViewState(this.catlist);
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
            label: Text("Category Name"),
          ),
          DataColumn(
            label: Text("Color"),
          ),
          DataColumn(
            label: Text("Code"),
          ),
          DataColumn(
            label: Text("Quantity"),
          ),
        ],
        rows: data
            .map<DataRow>(
              (catlist) => DataRow(cells: [
                DataCell(
                  Text(catlist.name),
                ),
                DataCell(
                  Text(catlist.color),
                ),
                DataCell(
                  Text(catlist.code),
                ),
                DataCell(
                  Text('${catlist.quantity}'),
                ),
              ]),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = this.catlist;
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

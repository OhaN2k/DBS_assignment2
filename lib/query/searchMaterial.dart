import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart' as mysql;
import 'purchase.dart';

class SearchMaterial extends StatefulWidget {
  final String material;

  SearchMaterial({Key key, this.material}): super(key: key);

  @override
  SearchMaterialState createState() => SearchMaterialState();
}

class SearchMaterialState extends State<SearchMaterial> {

  Future<List<Purchase>> purchases;

  @override
  void initState() {
    purchases = Purchase.getPurchases(widget.material);
    super.initState();
  }

  InteractiveViewer dataBody(var data){
    return InteractiveViewer(
      constrained: false,
      child:
      DataTable(
        columns: [
          DataColumn(
            label: Text("Supplier Name"),
          ),
          DataColumn(
            label: Text("Phone Number"),
          ),
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
              (purchase) => DataRow(
              cells: [
                DataCell(
                  Text(purchase.supName),
                ),
                DataCell(
                  Text(purchase.supPhone),
                ),
                DataCell(
                  Text(purchase.proDate),
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
    return FutureBuilder(
      future: purchases,
      builder: (context, snapshot) {
        var data = snapshot.data;
        //     .map<Purchase>((value) =>
        //   new Purchase(
        //       supName: value.supName,
        //       supAddress: value.supAddress,
        //   )
        // );
        return Scaffold(
            appBar: AppBar(
              title: Text(widget.material.toUpperCase() + " Purchase History", style: TextStyle(fontSize: 30.0,),),
              centerTitle: true,
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
      }
    );
  }
}
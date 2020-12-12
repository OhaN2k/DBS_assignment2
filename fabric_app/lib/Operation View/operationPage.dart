import 'package:fabric_app/List%20Category%20Info/category.dart';
import 'package:flutter/material.dart';
import 'package:fabric_app/Purchase Info/searchMaterial.dart';
import 'package:fabric_app/Purchase Info/purchase.dart';
import 'package:fabric_app/Add%20Supplier/supplier.dart';
import 'package:fabric_app/List Category View/listCat.dart';
import 'package:fabric_app/Order View/order.dart';
import 'package:fabric_app/Order View/orderView.dart';

class OperationPage extends StatefulWidget {
  OperationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OperationPageState createState() => _OperationPageState();
}

class _OperationPageState extends State<OperationPage> {
  TextEditingController material = new TextEditingController();
  TextEditingController input1 = new TextEditingController();
  TextEditingController input2 = new TextEditingController();
  TextEditingController input3 = new TextEditingController();
  TextEditingController input4 = new TextEditingController();
  TextEditingController input5 = new TextEditingController();
  TextEditingController input6 = new TextEditingController();
  // TextEditingController input2 = new TextEditingController();
  bool _validate = false;
  List<Widget> search = [];
  var o = SearchMaterial();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(
            "Fabric Database",
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buttonTheme(
                  'Search Data',
                  'Search',
                  [
                    inputText('Category Name', 'Category not available', false,
                        input1)
                  ],
                  _validate),
              SizedBox(height: 50),
              buttonTheme(
                  'Add Supplier',
                  'Add',
                  [
                    inputText('Name', '', false, input1),
                    inputText('Country Code', '', false, input2),
                    inputText('Address', '', false, input3),
                    inputText('Bank Account', '', false, input4),
                    inputText('Tax Code', '', false, input5),
                    inputText('Phone Number', '', false, input6),
                  ],
                  _validate),
              SizedBox(height: 50),
              buttonTheme('List Category Detail', 'List',
                  [inputText('Supplier Code', '', false, input1)], _validate),
              SizedBox(height: 50),
              buttonTheme(
                  'Order Report',
                  'Generate',
                  [
                    inputText('Category Name', '', false, input1),
                    inputText('Customer Name', '', false, input2)
                  ],
                  _validate)
            ],
          ),
        ));
  }

  clearInput() {
    input1.clear();
    input2.clear();
    input3.clear();
    input4.clear();
    input5.clear();
    input6.clear();
  }

  Widget inputText(String hint, String error, bool validate,
      TextEditingController material) {
    //bool _validate = validate;
    return TextFormField(
        controller: material,
        decoration: InputDecoration(
            errorText: validate ? error : null,
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            filled: true,
            suffixIcon: IconButton(
              icon: Icon(Icons.clear, color: Colors.red),
              onPressed: () => material.clear(),
            )));
  }

  Widget buttonTheme(
      String operation, String action, List<Widget> search, bool validate) {
    return ButtonTheme(
      minWidth: 230.0,
      height: 45.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(18.0)),
        color: Colors.pinkAccent,
        textColor: Colors.white,
        padding: EdgeInsets.all(8.0),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                //bool _validate = validate;
                return StatefulBuilder(builder: (context, setState) {
                  return AlertDialog(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 5,
                            color: Colors.pinkAccent,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(32.0))),
                      scrollable: true,
                      insetPadding: EdgeInsets.symmetric(horizontal: 50),
                      content: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Positioned(
                              right: -40.0,
                              top: -40.0,
                              child: InkResponse(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: CircleAvatar(
                                  child: Icon(Icons.close),
                                  backgroundColor: Colors.red,
                                ),
                              ),
                            ),
                            Form(
                              // key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  padList(search),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RaisedButton(
                                      child: Text(action),
                                      onPressed: () async {
                                        var value;
                                        if (operation == 'Search Data' &&
                                            input1 != null) {
                                          await Purchase.getPurchases(
                                                  input1.text)
                                              .then((onValue) {
                                            value = onValue;
                                            if (value is! List<Purchase> ||
                                                value.isEmpty) {
                                              print(value);
                                            } else if (value
                                                is List<Purchase>) {
                                              var classObj = SearchMaterial(
                                                  material: value);
                                              print('purchases');
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        classObj),
                                              );
                                            }
                                          });
                                        } else if (operation ==
                                                'Add Supplier' &&
                                            input1 != null &&
                                            input2 != null &&
                                            input3 != null &&
                                            input4 != null &&
                                            input5 != null &&
                                            input6 != null) {
                                          print(input5.text);
                                          value = Supplier(
                                              input1.text,
                                              input2.text,
                                              input3.text,
                                              input4.text,
                                              input5.text,
                                              input6.text);
                                          if (value.checkValid() != 'Success')
                                            return null;
                                          print(value.input.length);
                                          await Supplier.addSupplier(
                                                  value.input)
                                              .then((onValue) {
                                            value = onValue;
                                            if (value != 'Successful') {
                                              print(value);
                                            }
                                            print('value');
                                          });
                                        } else if (operation ==
                                            'List Category Detail') {
                                          print(operation);
                                          await Supplier.listCate(input1.text)
                                              .then((onValue) {
                                            value = onValue;
                                            if (value is List<Category> &&
                                                !value.isEmpty) {
                                              var classObj = ListCategoryView(
                                                  material: value);
                                              print('purchases');
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        classObj),
                                              );
                                            } else
                                              print(value);
                                          });
                                        } else if (operation ==
                                            'Order Report') {
                                          await Order.listOrder(
                                                  input1.text, input2.text)
                                              .then((onValue) {
                                            value = onValue;
                                            if (value is List<Order> &&
                                                !value.isEmpty) {
                                              var classObj = ListOrderView(
                                                  material: value);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        classObj),
                                              );
                                            } else
                                              print(value);
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ));
                });
              });
        },
        child: Text(
          operation.toUpperCase(),
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  Widget padList(List<Widget> lpad) {
    return Container(
        height: lpad.length > 3
            ? MediaQuery.of(context).size.height / 3
            : MediaQuery.of(context).size.height / 6,
        //height: 50.0 * lpad.length + 50, // Change as per your requirement
        width: 300.0,
        child: ListView.builder(
            //shrinkWrap: true,
            itemCount: lpad.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(padding: EdgeInsets.all(8.0), child: lpad[index]);
            }));
  }
}

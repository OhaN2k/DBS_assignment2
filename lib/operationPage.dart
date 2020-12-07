import 'package:flutter/material.dart';
import 'query/searchMaterial.dart';

class OperationPage extends StatefulWidget {
  OperationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OperationPageState createState() => _OperationPageState();
}

class _OperationPageState extends State<OperationPage> {
  TextEditingController  material = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fabric Database", style: TextStyle(fontSize: 30.0,),),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: 230.0,
                height: 45.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(18.0)
                  ),
                  color: Colors.pinkAccent,
                  textColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Stack(
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
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: material,
                                            decoration: InputDecoration(
                                              hintText: "category name",
                                              hintStyle: TextStyle(color: Colors.grey),
                                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                              filled: true,
                                              suffixIcon: IconButton(icon: Icon(Icons.clear, color: Colors.red), onPressed: ()=>print("Se xoa het chu di"),)
                                          )
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RaisedButton(
                                          child: Text("Search"),
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchMaterial(material: material.text)),
                                            );
                                            // if (_formKey.currentState.validate()) {
                                            //   _formKey.currentState.save();
                                            // }
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: Text("Search for data".toUpperCase(),
                    style: TextStyle(fontSize: 20.0,),
                  ),
                ),
              ),
              SizedBox(height: 50),
              ButtonTheme(
                minWidth: 230.0,
                height: 45.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(18.0)
                  ),
                  color: Colors.pinkAccent,
                  textColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Stack(
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
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              hintText: "Attribute 1",
                                              hintStyle: TextStyle(color: Colors.grey),
                                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                              filled: true,
                                              suffixIcon: IconButton(icon: Icon(Icons.clear, color: Colors.red), onPressed: ()=>print("Se xoa het chu di"),)
                                          )
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(
                                            decoration: InputDecoration(
                                                hintText: "Attribute 2",
                                                hintStyle: TextStyle(color: Colors.grey),
                                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                                filled: true,
                                                suffixIcon: IconButton(icon: Icon(Icons.clear, color: Colors.red), onPressed: ()=>print("Se xoa het chu di"),)
                                            )
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RaisedButton(
                                          child: Text("Submit"),
                                          onPressed: () {print("Cho nay tran nguyen lam");},
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: Text("Insert data".toUpperCase(),
                    style: TextStyle(fontSize: 20.0,),
                  ),
                ),
              ),
              SizedBox(height: 50),
              ButtonTheme(
                minWidth: 230.0,
                height: 45.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(18.0)
                  ),
                  color: Colors.pinkAccent,
                  textColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {print("Cho nay Tran Nguyen lam :))");},
                  child: Text("List all categories".toUpperCase(),
                    style: TextStyle(fontSize: 20.0,),
                  ),
                ),
              ),
              SizedBox(height: 50),
              ButtonTheme(
                minWidth: 230.0,
                height: 45.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(18.0)
                  ),
                  color: Colors.pinkAccent,
                  textColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    print("Make a report");
                  },
                  child: Text("Make a report".toUpperCase(),
                    style: TextStyle(fontSize: 20.0,),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}








//
// class _MyAppState extends State<MyApp> {
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter"),
//       ),
//       body: Center(
//         child: RaisedButton(
//           onPressed: () {
//             showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     content: Stack(
//                       overflow: Overflow.visible,
//                       children: <Widget>[
//                         Positioned(
//                           right: -40.0,
//                           top: -40.0,
//                           child: InkResponse(
//                             onTap: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: CircleAvatar(
//                               child: Icon(Icons.close),
//                               backgroundColor: Colors.red,
//                             ),
//                           ),
//                         ),
//                         Form(
//                           key: _formKey,
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: TextFormField(),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: TextFormField(),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: RaisedButton(
//                                   child: Text("Submitß"),
//                                   onPressed: () {
//                                     if (_formKey.currentState.validate()) {
//                                       _formKey.currentState.save();
//                                     }
//                                   },
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 });
//           },
//           child: Text("Open Popup"),
//         ),
//       ),
//     );
//   }
// }
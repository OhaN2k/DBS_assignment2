import 'package:mysql1/mysql1.dart';
import 'package:fabric_app/Establish Connect/connectService.dart';

class Category {
  String name;
  String color;
  String code;
  int quantity;

  Category({this.name, this.color, this.code, this.quantity});
}

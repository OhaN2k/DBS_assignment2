import 'dart:ffi';
import 'package:mysql1/mysql1.dart';
import 'package:fabric_app/Establish Connect/connectService.dart';
import 'package:intl/intl.dart';

class Order {
  String code;
  String cus_code;
  double total_price;
  String emp_code;
  String pro_date;
  String pro_time;

  List<Order> input = [];
  Order(
      {this.code,
      this.cus_code,
      this.total_price,
      this.emp_code,
      this.pro_date,
      this.pro_time});

  static Future<dynamic> listOrder(String cat_name, String cus_code) async {
    try {
      Results results = await Service.conn.query("""
        SELECT o.* 
        FROM orders o 
        JOIN bolt b ON o.code = b.o_code 
        JOIN category ct ON b.cat_code = ct.code 
        WHERE o.cus_code = ? AND ct.cat_name = ?;
        """, [cus_code, cat_name]);
      //await Service.conn.close();
      List<Order> list = [];
      for (var row in results) {
        list.add(Order(
            code: row[0],
            cus_code: row[1],
            total_price: row[2],
            emp_code: row[3],
            pro_date: row[4].toString(),
            pro_time: row[5].toString()));
      }
      return list;
    } catch (error) {
      // print(error);
      return error;
    }
  }
}

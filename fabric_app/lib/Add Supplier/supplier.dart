import 'package:fabric_app/List%20Category%20Info/category.dart';
import 'package:mysql1/mysql1.dart';
import 'package:fabric_app/Establish Connect/connectService.dart';
import 'package:intl/intl.dart';

class Supplier {
  String name;
  String address;
  String countryCode;
  String taxCode;
  String bankAccount;
  String code = '';
  String phone;
  List<String> input = [];
  Supplier(this.name, this.countryCode, this.address, this.bankAccount,
      this.taxCode, this.phone);

  String checkValid() {
    DateTime now = DateTime.now();
    String year = DateFormat('yyyy').format(now);
    if (this.name.length > 15) {
      return 'Name too long.';
    }
    if (this.countryCode.length > 3 || this.countryCode.isEmpty) {
      return 'Country code too long or invalid.';
    }
    if (this.bankAccount.length > 15 || this.bankAccount.isEmpty) {
      return 'Bank account too long or invalid.';
    }
    if (this.taxCode.length > 13 || this.taxCode.isEmpty) {
      return 'Tax code too long or invalid.';
    }
    if (this.phone.length > 11 || this.phone.isEmpty) {
      return 'Phone Number too long or invalid.';
    }
    this.code = this.countryCode +
        year.substring(2) +
        this.bankAccount.substring(this.bankAccount.length - 2) +
        this.taxCode.substring(this.taxCode.length - 2);
    input = [
      this.code,
      this.name,
      this.address,
      this.bankAccount,
      this.taxCode,
      this.phone
    ];
    return 'Success';
  }

  static Future<dynamic> addSupplier(List<String> material) async {
    try {
      Results results = await Service.conn.query("""
        CALL req2(?, ?, ?, ?, ?, ?);
        """, [
        material[0],
        material[1],
        material[2],
        material[3],
        material[4],
        material[5]
      ]);
      //await Service.conn.close();
      return "Successful";
    } catch (error) {
      // print(error);
      return error;
    }
  }

  static Future<dynamic> listCate(String material) async {
    try {
      Results results = await Service.conn.query("""
        select distinct category.cat_name,category.color,category.code,category.quantity 
        from (category LEFT JOIN ( supplier LEFT JOIN provides ON supplier.code = provides.sup_code) ON category.code = provides.cat_code) 
        WHERE supplier.code = ?;
        """, [material]);
      //await Service.conn.close();
      List<Category> list = [];
      for (var row in results) {
        list.add(Category(
            name: row[0], color: row[1], code: row[2], quantity: row[3]));
      }
      return list;
    } catch (error) {
      // print(error);
      return error;
    }
  }
}

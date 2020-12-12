import 'package:mysql1/mysql1.dart' as mysql;
import 'package:fabric_app/Establish Connect/connectService.dart';

class Purchase {
  String supName;
  String supPhone;
  String proDate;
  String quantity;
  String price;

  Purchase(
      {this.supName, this.supPhone, this.proDate, this.quantity, this.price});

  static Future<dynamic> getPurchases(String material) async {
    // print(material);
    // final conn = await mysql.MySqlConnection.connect(mysql.ConnectionSettings(
    //   host: '10.0.2.2',
    //   port: 3306,
    //   user: 'root',
    //   password: 'trannguyen121223',
    //   db: 'fabric_database',
    // ));
    //await Service().connect();
    try {
      mysql.Results results = await Service.conn.query("""
        SELECT s.sup_name, ph.phone, pr.pro_date, pr.cat_quantity, pr.price
        FROM sup_phone ph, supplier s, provides pr, category c
        WHERE c.cat_name = ? AND c.code = pr.cat_code AND pr.sup_code = s.code AND s.code = ph.sup_code;
        """, [material]);
      List<Purchase> list = [];
      for (var row in results) {
        list.add(Purchase(
            supName: row[0].toString(),
            supPhone: row[1].toString(),
            proDate: row[2].toString(),
            quantity: row[3].toString(),
            price: row[4].toString()));
      }
      //await Service.conn.close();
      return list;
    } catch (error) {
      // print(error);
      return error;
    }
  }
}

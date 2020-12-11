import 'package:mysql1/mysql1.dart' as mysql;

class ReportList {
  String orderCode;
  String cusCode;
  String totalPrice;
  String empCode;
  String proDate;
  String proTime;

  ReportList(
      {this.orderCode,
        this.cusCode,
        this.totalPrice,
        this.empCode,
        this.proDate,
        this.proTime});

  static Future<List<ReportList>> makeReport(
      String inputCusCode, String inputCatCode) async {
    print(inputCusCode + '\n' + inputCatCode);
    final conn = await mysql.MySqlConnection.connect(mysql.ConnectionSettings(
      host: '10.0.2.2',
      port: 3306,
      user: 'root',
      password: '1234',
      db: 'fabric_database',
    ));
    mysql.Results results = await conn.query("""
      SELECT o.* 
      FROM ORDERS o 
      JOIN BOLT b ON o.code = b.o_code 
      JOIN CATEGORY ct ON b.cat_code = ct.code 
      WHERE o.cusCode = inputCusCode AND ct.cat_name = inputCatName;
      """, [inputCusCode, inputCatCode]);
    List<ReportList> list = [];
    for (var row in results) {
      list.add(ReportList(
          orderCode: row[0].toString(),
          cusCode: row[1].toString(),
          totalPrice: row[2].toString(),
          empCode: row[3].toString(),
          proDate: row[4].toString(),
          proTime: row[5].toString()));
    }
    await conn.close();
    return list;
  }
}
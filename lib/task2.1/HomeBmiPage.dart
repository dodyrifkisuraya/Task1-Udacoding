import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flushbar/flushbar.dart';

class HomeBmiPage extends StatefulWidget {
  @override
  _HomeBmiPage createState() => _HomeBmiPage();
}

double kuadrat(double x) {
  return x * x;
}

String formatDecimal(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
}

class _HomeBmiPage extends State<HomeBmiPage> {
  TextEditingController tbController = TextEditingController();
  TextEditingController bbController = TextEditingController();
  double result = 0, pembilang, pembagi;
  String ket = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Container(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    "Kalkulator BMI",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: 300,
                  child: Text(
                    "Silahkan tinggi badan dan berat badan Kamu. ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: tbController,
                      decoration: InputDecoration(
                          hintText: "Tinggi Badan ( cm )",
                          border: InputBorder.none),
                      cursorColor: Colors.amber,
                      style: TextStyle(color: Colors.grey[700]),
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: bbController,
                      decoration: InputDecoration(
                          hintText: "Berat Badan ( cm )",
                          border: InputBorder.none),
                      cursorColor: Colors.amber,
                      style: TextStyle(color: Colors.grey[700]),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.amber,
                  ),
                  child: FlatButton(
                    child: Text(
                      'Hitung',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      if (bbController.text.isNotEmpty &&
                          tbController.text.isNotEmpty) {
                        pembilang = double.parse(bbController.text);
                        pembagi =
                            kuadrat(double.parse(tbController.text) / 100);
                        result = pembilang / pembagi;
                        if (result >= 30) {
                          print(
                              'kegemukan, $pembilang + / + $pembagi + = $result');
                          setState(() {
                            ket = 'OBESITAS';
                            result = result;
                          });
                        } else if (25 < result && result < 29.9) {
                          print(
                              'kelebihan beratbadan, $pembilang + / + $pembagi + = $result');
                          setState(() {
                            ket = 'KELEBIHAN';
                            result = result;
                          });
                        } else if (18.5 < result && result < 24.9) {
                          print(
                              'normal, $pembilang + / + $pembagi + = $result');
                          setState(() {
                            ket = 'IDEAL';
                            result = result;
                          });
                        } else {
                          print(
                              'kekurangan, $pembilang + / + $pembagi + = $result');
                          setState(() {
                            ket = 'KEKURANGAN';
                            result = result;
                          });
                        }
                      } else {
                        Flushbar(
                          message: "Tingi Badan dan Berat Badan harus disi!",
                          icon: Icon(
                            Icons.info_outline,
                            size: 28.0,
                            color: Colors.red,
                          ),
                          duration: Duration(seconds: 3),
                          leftBarIndicatorColor: Colors.red,
                        )..show(context);
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.red,
                  ),
                  child: FlatButton(
                    child: Text(
                      'Reset',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      setState(() {
                        result = 0;
                        ket = "";
                      });
                      tbController.clear();
                      bbController.clear();
                    },
                  ),
                ),
                SizedBox(height: 8,),
                Text('Nilai BMI', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black54
                ),),
                Column(
                  children: [
                    Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(0),
                              bottomLeft: Radius.circular(0)),
                        ),
                        child: Text(
                          formatDecimal(result),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 25,
                          ),
                        )),
                    Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          color: Colors.grey[200],
                        ),
                        child: Text(
                          ket.toString(),
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 70,
                          ),
                        )),
                  ],
                ),
              ],
            )));
  }
}

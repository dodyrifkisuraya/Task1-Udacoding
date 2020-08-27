import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Calculator extends StatefulWidget {
  @override
  _Calculator createState() => _Calculator();
}

double kuadrat(double x) {
  return x * x;
}

String formatDecimal(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
}

String hasil = "0";
String addCharacter(String awal, String x) {
  if (awal == "0") {
    return x;
  } else {
    return hasil + x;
  }
}

class _Calculator extends State<Calculator> {
  final double _padding = 16.0;
  final double _buttonFontSize = 24.0;

  String operator = "";

  void deletLast() => setState(() {
        if (hasil.length > 0) {
          String lastCharacter = hasil.substring(hasil.length - 1);
          if (lastCharacter == "/" ||
              lastCharacter == "x" ||
              lastCharacter == "-" ||
              lastCharacter == "+") {
            operator = "";
          }
          if (hasil != "0") {
            if (hasil.length > 1) {
              hasil = hasil.substring(0, hasil.length - 1);
            } else {
              hasil = "0";
            }
          }
        }
      });

  void hitung(String btnInput) => setState(() {
        bool harusHitung = false;
        if (btnInput == "=") {
          print("=");
          harusHitung = true;
        } else if (btnInput == "/" ||
            btnInput == "x" ||
            btnInput == "-" ||
            btnInput == "+") {
          if (operator.isEmpty) {
            print("Operator Sebelumnya Kosong");
            operator = btnInput;
          } else {
            print("Lempar Hitung, Karena Operator sebelumnya ada isinya.");
            harusHitung = true;
          }
        }

        if (!harusHitung) {
          print("Nulis doang : " + btnInput);
          if (hasil == "0") {
            hasil = "";
          }
          hasil = addCharacter(hasil, btnInput);
          // operator = "";
        } else {
          print("Mulai ngitung nih ============");
          List<String> values = hasil.split(operator);
          print(values[0] + ' ,' + values[1]);
          if (values.length == 2 &&
              values[0].isNotEmpty &&
              values[1].isNotEmpty) {
            int valueA = int.parse(values[0]);
            int valueB = int.parse(values[1]);
            operasi = hasil;
            sam = "=";
            switch (operator) {
              case "/":
                hasil = (valueA / valueB).toString();
                break;
              case "x":
                hasil = (valueA * valueB).toString();
                break;
              case "-":
                hasil = (valueA - valueB).toString();
                break;
              case "+":
                hasil = (valueA + valueB).toString();
            }
            if (btnInput == "/" ||
                btnInput == "x" ||
                btnInput == "-" ||
                btnInput == "+") {
              operator = btnInput;
              hasil = addCharacter(hasil, btnInput);
            } else {
              operator = "";
            }
          }
        }
      });

  final Color _primarySwatchColor = Colors.amber;
  final Color _buttonColorWhite = Colors.white;
  final Color _buttonHighlightColor = Colors.grey[800];
  final Color _buttonColorGrey = Colors.grey[500];

  String operasi = "", sam = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Column(
          children: <Widget>[
            Expanded(
              key: Key("expanded_bagian_atas"),
              flex: 1,
              child: Container(
                key: Key("expanded_container_bagian_atas"),
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(_padding),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    AutoSizeText(
                      hasil,
                      style: Theme.of(context).textTheme.headline3,
                      maxLines: 1,
                    ),
                    Positioned(
                        bottom: 58,
                        right: 0,
                        child: AutoSizeText(
                          operasi,
                          style: TextStyle(fontSize: 30, color: Colors.grey),
                          maxLines: 1,
                        )),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: AutoSizeText(
                        sam,
                        style: Theme.of(context).textTheme.headline3,
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              key: Key("expanded_bagian_bawah"),
              flex: 1,
              child: Column(
                key: Key("expanded_column_bagian_bawah"),
                children: <Widget>[
                  Expanded(
                    key: Key("expanded_bagian_bawah"),
                    flex: 1,
                    child: Column(
                      key: Key("expanded_column_bagian_bawah"),
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "C",
                                    style: TextStyle(
                                        color: _primarySwatchColor,
                                        fontSize: _buttonFontSize),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      operasi = "";
                                      hasil = "0";
                                      sam = "";
                                      operator = "";
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Icon(
                                    Icons.backspace,
                                    color: _buttonColorGrey,
                                  ),
                                  onPressed: () {
                                    deletLast();
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "/",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    hitung("/");
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "7",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    hitung("7");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "8",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    hitung("8");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    hitung("9");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "x",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    hitung("x");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "4",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    hitung("4");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "5",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    hitung("5");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "6",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    hitung("6");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    hitung("-");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    hitung("1");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    hitung("2");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "3",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    hitung("3");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    hitung("+");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "0",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    hitung("0");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _primarySwatchColor,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "=",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    hitung("=");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

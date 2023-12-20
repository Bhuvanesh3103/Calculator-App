import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget calcButton(String btntext, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(20),
          backgroundColor: btncolor,
        ),
        child: Text(
          btntext,
          style: TextStyle(fontSize: 25, color: txtcolor),
        ),
        onPressed: () => btnClicked(btntext),
      ),
    );
  }

  int first = 0, second = 0;
  String res = '', text = '', opp = '';
  void btnClicked(String val) {
    if (val == 'AC') {
      text = '';
      res = '';
      first = 0;
      second = 0;
    } else if (val == '+' || val == '-' || val == 'x' || val == '/') {
      first = int.parse(text);
      res = '';
      opp = val;
    } else if (val == '=') {
      second = int.parse(text);
      if (opp == '+') {
        res = (first + second).toString();
      }
      if (opp == '-') {
        res = (first - second).toString();
      }
      if (opp == 'x') {
        res = (first * second).toString();
      }
      if (opp == '/') {
        res = (first / second).toString();
      }
    } else {
      res = text + val;
    }
    setState(() {
      text = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Calculator',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: (Text(
                      text,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 85,
                          fontWeight: FontWeight.w400),
                    )),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton('AC', Colors.grey, Colors.black),
                calcButton('+/-', Colors.grey, Colors.black),
                calcButton('%', Colors.grey, Colors.black),
                calcButton('/', Colors.amber.shade700, Colors.black),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton('7', Colors.grey.shade800, Colors.white),
                calcButton('8', Colors.grey.shade800, Colors.white),
                calcButton('9', Colors.grey.shade800, Colors.white),
                calcButton('x', Colors.amber.shade700, Colors.black),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton('4', Colors.grey.shade800, Colors.white),
                calcButton('5', Colors.grey.shade800, Colors.white),
                calcButton('6', Colors.grey.shade800, Colors.white),
                calcButton('-', Colors.amber.shade700, Colors.black),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton('1', Colors.grey.shade800, Colors.white),
                calcButton('2', Colors.grey.shade800, Colors.white),
                calcButton('3', Colors.grey.shade800, Colors.white),
                calcButton('+', Colors.amber.shade700, Colors.black),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => btnClicked('0'),
                  child: Text(
                    '0',
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      minimumSize: Size(165, 68),
                      backgroundColor: Colors.grey.shade800),
                ),
                calcButton('.', Colors.grey.shade800, Colors.white),
                calcButton('=', Colors.amber.shade700, Colors.black),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

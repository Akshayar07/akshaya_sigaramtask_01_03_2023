import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Matrix Game',
      home: Box(),
    );
  }
}



class Box extends StatefulWidget {
  @override
  _BoxState createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _num = 1;
  List<int> _Clickbox = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Matrix Game',style: TextStyle(color: Colors.red),)),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Container(
          child: GridView.count(
            crossAxisCount: 4,
            children: List.generate(16, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _num++;
                    if (_Clickbox.length < 2) {
                      _Clickbox.add(index);
                    } else {
                      _Clickbox.removeAt(0);
                      _Clickbox.add(index);
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color:
                    (_Clickbox.contains(index)) ? Colors.red : Color(0xff00008B),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      (_Clickbox.indexOf(index) >= 0)
                          ? "Box #${_num - _Clickbox.length + _Clickbox.indexOf(index)}"
                          : "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      )
    );
  }
}

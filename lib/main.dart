import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static Duration duration = Duration(milliseconds: 20);
  late Timer timer;
  double _value = 0.0;
  bool _active = false;
  @override
  void initState() {
    timer = Timer.periodic(duration, _timeout);
  }

  void _timeout(Timer timer) {
    if (!_active) return;
    setState(() {
      _value = _value + 0.01;
      if (_value == 1.0) _active = false;
    });
  }

  void _onPressed() {
    setState(() {
      _value = 0.0;
      _active = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress indicator'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(32.0),
                child: LinearProgressIndicator(
                  value: _value,
                  backgroundColor: Colors.white10,
                ),
              ),
              ElevatedButton(onPressed: _onPressed, child: Text("Start"))
            ],
          ),
        ),
      ),
    );
  }
}

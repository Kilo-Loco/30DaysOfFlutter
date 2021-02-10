import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
          Card(
              child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Image.asset('images/codepassionately.png'),
                Text(
                  'Code Passionately',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
          TextButton(
            child: Text('Take Screenshot and Share'),
            onPressed: () {},
          )
        ]))));
  }
}

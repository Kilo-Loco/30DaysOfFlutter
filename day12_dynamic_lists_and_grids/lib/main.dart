import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _users = List.filled(100, "kilo loco");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.white70,
            appBar: AppBar(
              bottom: TabBar(tabs: [Text('List'), Text('Grid')]),
            ),
            body:
                TabBarView(children: [_contentListView(), _contentGridView()]),
          )),
    );
  }

  Widget _contentListView() {
    return ListView.builder(
      itemCount: _users.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(index.toString()),
          onTap: () => print("hello $index"),
        ),
      ),
    );
  }

  Widget _contentGridView() {
    return GridView.builder(
        itemCount: _users.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) =>
            Card(child: GridTile(child: Center(child: Text(_users[index])))));
  }
}

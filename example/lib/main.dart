import 'package:flutter/material.dart';
import 'package:uilistview/f_ui_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: FUIListView(
          header: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 60),
            height: 500,
            color: Colors.cyan,
          ),
          footer: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 60),
            height: 500,
            color: Colors.deepOrange,
          ),
          builder: (BuildContext context, dynamic item, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20)
                  .copyWith(bottom: 40),
              height: 200,
              color: Colors.amber,
              child: Center(
                child: Text(
                    'index = ${index.toString()} / text = ${item.toString()}'),
              ),
            );
          },
          data: const [1, 2, 3, 4, 5, 6],
        ),
      ),
    );
  }
}

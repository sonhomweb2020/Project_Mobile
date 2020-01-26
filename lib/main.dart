import 'package:flutter/material.dart' ;
import 'package:flutter/widgets.dart';
import 'ToDoList.dart';

void main() => runApp(Home());
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoList(),
    );
  }
}
import 'dart:ffi';

import 'package:flutter/material.dart';

class CounterUi extends StatefulWidget {
  const CounterUi({super.key});

  @override
  State<CounterUi> createState() => _CounterUiState();
}

class _CounterUiState extends State<CounterUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text('Bloc_practice'),
  centerTitle: true,
),
body: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Text('0', style: TextStyle(fontSize: 60),),
  SizedBox(height: 20,),
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(onPressed: (){}, child: Icon(Icons.remove)),
      SizedBox(width: 20,),
      ElevatedButton(onPressed: (){}, child: Icon(Icons.add))
    ],
  ),
],),
    );
  }
}
import 'package:flutter/material.dart';
//import 'package:wmktestapp/word/RandomWords.dart';
import 'package:wmktestapp/lake/LakeMaker.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //随机文字 demo
    //return new MaterialApp(title: '随机文字列表',home: new RandomWords(),theme: new ThemeData(primaryColor: Colors.white));
    //lake widget 布局入门
    return new MaterialApp(title: 'lake image',home: new LakeMaker());
  }
}
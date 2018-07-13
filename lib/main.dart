import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter 结构简析',
      theme: new ThemeData(
        primarySwatch: Colors.blue, // 这里是项目的主色调
      ),
//      home: MyHomePage(), // 简单介绍结构的例子
      home: TutorialsPage(), // demo2
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我是标题'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('我是第一个item')),
          ListTile(title: Text('我是第二个item')),
        ],
      ),
    );
  }
}

/// 对应 https://flutter.io/tutorials/layout/ 的 https://flutter.io/tutorials/layout/images/lakes.jpg 图片
class TutorialsPage extends StatefulWidget {
  @override
  _TutorialsPageState createState() => _TutorialsPageState();
}

class _TutorialsPageState extends State<TutorialsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          //为了好分辨,我将内部的4大块分为四个方法
          _buildHeader(),
          Padding(
            //这里我观察到下面有一个整体的左右边距,所以这里单独抽取了一个padding
            child: Column(
              children: <Widget>[
                _buildSecond(), // 第二部分
                _buildThird(),
                _buildFourth(),
              ],
            ),
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    // 这里对应的是图片
    return Image.asset("images/lakes_header.jpg");
  }

  _buildSecond() {
    Widget row = Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Text('旅游圣地'),
              Text(
                '不要钱',
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Text('30'),
          ],
        ),
      ],
    );
    row = SizedBox(
      height: 60.0,
      child: row,
    );
    return row;
  }

  _buildThird() {
    Widget buildItem(IconData iconData, String text) {
      return Expanded(
        child: SizedBox(
          height: 50.0,
          child: Column(
            children: <Widget>[
              Icon(
                iconData,
                color: Colors.blue,
              ),
              Text(
                text,
                style: TextStyle(color: Colors.blue),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ),
      );
    }

    return Row(
      children: <Widget>[
        buildItem(Icons.phone, '呼叫'),
        buildItem(Icons.room, '导航'),
        buildItem(Icons.share, '分享'),
      ],
    );
  }

  _buildFourth() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '这个旅游地方我也不知道是什么地方,有什么流弊的,不过看起来还不错.\n\n'
            '这篇文章就到这里基本也没啥说的了,这个是第四部分,我就把内容直接放在Widget里面了,感谢观看,后面我可能会出一个简易的FAQ,专门写一些小白问题☺☺☺☺☺',
        style: TextStyle(
          fontSize: 13.0,
        ),
      ),
    );
  }
}

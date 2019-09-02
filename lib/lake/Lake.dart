import 'package:flutter/material.dart';
import 'package:wmktestapp/lake/LakeMaker.dart';


class Lake extends State<LakeMaker> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('lake demo --简单布局'),
      ),
      body: new ListView(
        children: [
          new Image.asset('images/lake.jpg',width: 600.0,height: 240.0,fit: BoxFit.cover),
          titleSection(),
          createbuttonSection(context),
          textSection()
        ],
      ),
    );
  }
  //标题
   Widget titleSection(){
     return new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text('漂亮的lake',style: new TextStyle( fontWeight: FontWeight.bold))
                ),
                new Text('这是一个漂亮的小琥珀',style: new TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          new Icon(Icons.star,color: Colors.red[500]),
          new Text('41'),
        ]
      )
    );
   }

   //按钮
  Widget createbuttonSection(BuildContext context){
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(context,Icons.call, 'CALL'),
          buildButtonColumn(context,Icons.near_me, 'ROUTE'),
          buildButtonColumn(context,Icons.share, 'SHARE')
        ]
      )
    );
  }
  Column buildButtonColumn(BuildContext context,IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Icon(icon, color: color),
        new Container(
        margin: const EdgeInsets.only(top: 8.0),
          child: new Text(label,style: new TextStyle(fontSize: 12.0,fontWeight: FontWeight.w400,color: color)),
        )
      ]
    );
  }
    //文本
    Widget textSection(){
      return new Container(
        padding: const EdgeInsets.all(32.0),
        child: new Text(
          '''
           欧斯钦恩湖位于伯尔尼阿尔卑斯山的比尔埃米利萨尔山脚下。它位于海拔1578米的高山湖泊之一。从坎德施泰格坐缆车，经过半个小时的牧场和松林步行，你会到达湖泊，在夏天这里的温度会上升到20摄氏度。这里的活动包括划船和骑夏季托博根跑。
          ''',
          softWrap: true
        )
      ); 
    }
}
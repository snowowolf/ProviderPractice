import 'package:flutter/material.dart';
import 'package:provide_practice/title.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //调用Provider.of<>(context)获取Provider中Title实例的值
    final titleText = Provider.of<TitleText>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Second')),
      body: Center(
          child: Column(
            children: <Widget>[
              FlatButton(onPressed: (){
                //跳转到first页面
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MyHomePage();
                }));
              },
                  child: Text(titleText.title)),
              FlatButton(onPressed: (){
                //修改title值
                titleText.set('456');
              },
                  child: Text('点我更新title值'))
            ],
          )),
      //floatingActionButton : const IncrementCounterButton()
    );
  }
}

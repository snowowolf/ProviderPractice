import 'package:flutter/material.dart';
import 'package:provide_practice/secondRoute.dart';
import 'package:provider/provider.dart';
import 'title.dart';

void main() => runApp(MyApp());

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return ChangeNotifierProvider<Counter>(
//      builder: (context) => Counter(),
//       child: MaterialApp(
//         title: 'flutter demo',
//         home: const MyHomePage(),
//    ),
//    );
//  }
//}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<TitleText>(
        builder: (context)=>TitleText(),
        child: MaterialApp(
        title: 'myApp',
          home: const MyHomePage(),
    ),);
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final titleText = Provider.of<TitleText>(context);
    titleText.set('我是共享文字');
    return Scaffold(
        appBar: AppBar(title: Text('first')),
        body: Center(
            child: FlatButton(
            onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                      return SecondRoute();
               }));
            },
            child: Text(titleText.title)
            )
        ),
        //floatingActionButton : const IncrementCounterButton()
    );
  }
}

//class IncrementCounterButton extends StatelessWidget {
//  const IncrementCounterButton({Key key}) : super(key: key);
//  @override
//  Widget build(BuildContext context) {
//    final counter = Provider.of<Counter>(context);
//     return FloatingActionButton(
//       onPressed: ()=> counter.increment(),
//       tooltip: 'Increment',
//       child: Icon(Icons.add),
//     );
//  }
//}

//class CounterLabel extends StatelessWidget {
//  const CounterLabel({Key key}) : super(key: key);
//  @override
//  Widget build(BuildContext context) {
//    final counter = Provider.of<Counter>(context);
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Text(
//           'You have pushed the button this many times:',
//         ),
//         Text(
//           '${counter.count}',
//           style: Theme.of(context).textTheme.display1,
//         ),
//       ],
//     );
//  }
//}

//class Title extends StatelessWidget {
//  const Title({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    final titleText = Provider.of<TitleText>(context);
//    return Text(titleText.title);
//  }
//}

//class Counter with ChangeNotifier {
//  int _count = 0;
//  int get count => _count;
//
//  void increment() {
//    _count++;
//    notifyListeners();
//  }
//}
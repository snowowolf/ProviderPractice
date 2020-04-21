# ProviderPractice
>任何一个App都会有*username*这种需要全局使用的数据
任何一个App都会有*userdata*数据发生变化相关UI的同步更新的需求

Provider的目标就是完成此类任务
搭建一个工程，使用Provider完成第一个类型的任务
两个不同的页面使用同一个数据源的数据
最终效果如下图，页面1和页面2互相跳转，按钮文字共享一个数据源。
![第一个页面.png](https://upload-images.jianshu.io/upload_images/5318664-48aba186b182d83f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/240)
![第二个页面.png](https://upload-images.jianshu.io/upload_images/5318664-def5e60707f6e490.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/240)

#### 新建一个Flutter工程
##### 添加Provider三方库
在pubspec.yaml文件中添加
```
provider: ^3.1.0+1
```
添加后点击 get
如图
![屏幕快照 2019-11-15 上午10.00.54.png](https://upload-images.jianshu.io/upload_images/5318664-b0ff9a74a41f3971.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
##### lib目录下新建一个secondRoute.dart
```
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //调用Provider.of<>(context)获取Provider中Title实例的值
    final titleText = Provider.of<TitleText>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Second')),
      body: Center(
          child: FlatButton(
              onPressed: (){
                //跳转到first页面
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MyHomePage();
                }));
              },
              child: Text(titleText.title))),
      //floatingActionButton : const IncrementCounterButton()
    );
  }
}
```
##### lib目录下新建一个Title.dart
```
class TitleText {
  String  _title = '';
  String  get title => _title;
  void set(String title) {
    _title = title;
  }
}
```
##### 简化main.dart代码，
页面仅展示一个居中的按钮。
```
void main() => runApp(MyApp());
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
    titleText.set('123');
    return Scaffold(
        appBar: AppBar(title: Text(titleText.title)),
        body: Center(
            child: FlatButton(
            onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                      return SecondRoute();
               }));
            },
            child: Text(titleText.title))),
        //floatingActionButton : const IncrementCounterButton()
    );
  }
}
```
自此，我们在两个页面中通过Provider.of<>(context)获取使用了Provider中的Title数据。
至于Provider的原理以及源代码分析，本文不涉及。
可参考[Provider深入]()
#### 续
让我们在secondeRoute中添加另外一个按钮，点击该按钮时设置titleText，观察第一个按钮的文字是否会发生变化。代码如下
```
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
```
![屏幕快照 2019-11-15 上午10.38.50.png](https://upload-images.jianshu.io/upload_images/5318664-bff823f2e9f94c80.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/240)

发现点击更新title值后第一个按钮的文字并没有更新。
那么如何在我们修改了titleText后，让按钮的文字同步更新呢？
这就是文章开头的第二个类型任务了
请看[Flutter Provider入门（二)](https://www.jianshu.com/p/7d55655cfb89)




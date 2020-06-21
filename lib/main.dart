import 'package:flutter/material.dart';
import 'package:fluttergetxexample/list_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class Controller extends GetController {
  static Controller get to => Get.find();

  int counter = 0;
  void incrementCounter() {
    counter++;
    update();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GET - Thizer'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () => Get.to(ListPage()),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            GetBuilder(
                init: Controller(),
                builder: (controller) {
                  return Text('${controller.counter}');
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.find<Controller>().incrementCounter(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

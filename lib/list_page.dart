import 'package:flutter/material.dart';
import 'package:fluttergetxexample/main.dart';
import 'package:get/get.dart';

import 'favorites_controller.dart';

class ListPage extends StatelessWidget {
  FavoritesController fc = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get - Thizer 2 ${Controller.to.counter}'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () => null,
          )
        ],
      ),
      body: GetBuilder(
        init: FavoritesController(),
        builder: (FavoritesController favoritesController) {
          return GridView.count(
            crossAxisCount: 3,
            children: List.generate(Colors.primaries.length, (int i) {
              return Stack(
                children: <Widget>[
                  Container(
                    color: Colors.primaries[i],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.only(top: 10, right: 10),
                      child: IconButton(
                        onPressed: () {
                          favoritesController.toggle(i);
                        },
                        icon: Icon(favoritesController.isChecked(i)
                            ? Icons.favorite
                            : Icons.favorite_border),
                        color: Colors.red[300],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  )
                ],
              );
            }),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../Pages.dart';
import 'ScreenBodyWidget.dart';

class Listview1 extends StatelessWidget {
  late Map<String,int> list;


  Listview1(Map<String,int> list){
    this.list = Map.fromEntries(list.entries.toList()..sort((e1, e2) => e1.value.compareTo(e2.value)));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 20,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Colors.white70,
        child:ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomListView(list.keys.elementAt(index).toString());
            }
        )
    );
  }
}

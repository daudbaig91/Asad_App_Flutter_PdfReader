
import 'package:flutter/material.dart';

import '../NotificationClass2.dart';
import '../Pages.dart';
import '../SurahClass.dart';
import 'ScreenBodyWidget.dart';

class Listview1 extends StatelessWidget {
  late Map<String,int> list;


  Listview1(Map<String,int> list){
    this.list = Map.fromEntries(list.entries.toList()..sort((e1, e2) =>
        (int.parse(e1.key.substring(5)))
            .compareTo(int.parse(e2.key.substring(5)))));
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
               return CustomListView(list.keys.elementAt(index).toString(),index+1);
            }
        )
    );
  }
}

class Listview3 extends StatelessWidget {
  late List<SurahClass> list;


  Listview3(List<SurahClass> list){
    list.sort((a,b) => a.surah.compareTo(b.surah));
    this.list = list;
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
              return CustomListView2(
                list: list[index],
                index: index,
                onDelete: (){
                  print("done");
                  list.removeAt(index);
                  MyNotification2 notification = MyNotification2();
                  notification.surahcalled = true;
                  notification.surahlist = list;
                  notification..dispatch(context);
                },
              );
            }
        )
    );
  }
}
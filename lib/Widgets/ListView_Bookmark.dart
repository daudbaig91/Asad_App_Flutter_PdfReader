import 'package:asad_quran_app/BookMarkClass.dart';
import 'package:flutter/material.dart';

import 'ScreenBodyBookmar.dart';
import 'ScreenBodyWidget.dart';

class Listview2 extends StatelessWidget {
  late List<BookMarkClass> list;

  Listview2(this.list);

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 20,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Colors.white70,
        child:ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomBookmark(list[index]);
            }
        )
    );
  }
}
import 'package:asad_quran_app/SurahClass.dart';
import 'package:asad_quran_app/Widgets/PdfPagereferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../DisplayPdf.dart';

class CustomListView extends StatelessWidget {

  final String str;
  final int index;

  const CustomListView(this.str,this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        PageRef ref = new PageRef();

        print(ref.getPage(str));
        int string = int.parse(ref.getPage(str)!);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PdfDisplayer(page: string,)));
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(15,15,0,15),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xff458c51),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),topRight: Radius.circular(75),bottomLeft: Radius.circular(75))
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15,15,15,15),
                  child: Text(
                    index.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,15,0,15),
                child: Center(
                  child: Text(
                    str ,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,15,0,15),
              child: IconButton(
                onPressed: () {  },
                icon: Icon(CupertinoIcons.xmark),

              ),
            ),
            const Divider(height: 2.0,),

          ]),
    );
  }

}


class CustomListView2 extends StatelessWidget {

  final SurahClass list;
  final int index;
  final VoidCallback onDelete;

  CustomListView2({required this.list,required this.index,required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PdfDisplayer(page: list.page,)));
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(15,15,0,15),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xff458c51),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),topRight: Radius.circular(75),bottomLeft: Radius.circular(75))
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15,15,15,15),
                  child: Text(
                    index.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,15,0,15),
                child: Center(
                  child: Text(
                    "Surah ${list.surah}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,15,0,15),
              child: IconButton(
                onPressed: () => onDelete(),
                icon: Icon(CupertinoIcons.xmark),
              ),
            ),
            const Divider(height: 2.0,),
          ]),
    );
  }

}


import 'package:asad_quran_app/BookMarkClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PdfPagereferences.dart';

class CustomBookmark extends StatelessWidget {

  final BookMarkClass bookMarkClass;

  const CustomBookmark(this.bookMarkClass, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        PageRef ref = new PageRef();
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => PdfDisplayer(page: string,)));
      },
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15,15,0,15),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff458c51),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),topRight: Radius.circular(75),bottomLeft: Radius.circular(75))
                        ),
                        child: Padding(
                        padding: EdgeInsets.fromLTRB(15,15,15,15),
                        child: Text(
                        "1",
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,10,0,0),
                        child: Text("Surah: ${bookMarkClass.surah}",
                          style: const TextStyle(
                            color:  Color(0xff546e7a),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,0,0,0),
                        child: Text("Parah: ${bookMarkClass.parah}",
                          style: const TextStyle(
                              color: Color(0xff546e7a),
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,0,0,0),
                        child: Text("Page: ${bookMarkClass.page}",
                          style: const TextStyle(
                              color: Color(0xff546e7a),
                          ),),
                      ),

                    ],

                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,5,0,0),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Flexible(
                            child: Text(
                              "Title: " + bookMarkClass.title ,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,5,0,0),
                        child: Flexible(
                          child: Text(
                            "Description: " + bookMarkClass.desc ,
                            style: const TextStyle(
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0,15,0,15),
                  child: IconButton(
                    onPressed: () {  },
                    icon: Icon(CupertinoIcons.xmark),

                  ),
                ),
              ]),
          const Divider(height: 4.0,),
        ],

      ),

    );
  }
}

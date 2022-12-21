import 'package:asad_quran_app/SQLDatabase/BookMarkModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import '../DisplayPdf.dart';
import '../NotificationClass.dart';
import '../SQLDatabase/database.dart';


class RotateIcon extends StatefulWidget {
  int length;
  RotateIcon(this.length, {super.key});

  @override
  _RotateIconState createState() => _RotateIconState();
}

class _RotateIconState extends State<RotateIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  int length = 0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    _animation =
        Tween(begin: 0.0, end: .5).animate(CurvedAnimation(
            parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  //surah add
  int nameSurah = -1;
  int pageSurah = -1;

  // bookmark add
  int indexBookmark = -1;
  int surahBookmark = -1;
  int parahBookmark = -1;
  int pageBookmark = -1;
  String titleBookmark = "";
  String descBookmark = "";


  bool showWidget = false;
  @override
  Widget build(BuildContext context) {
    length = widget.length;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: showWidget ? 1.0 : 0.0,
            child: FloatingActionButton(
              heroTag: null,
              backgroundColor: const Color(0xfff28800),
              foregroundColor: Colors.white,

              onPressed: () {
                print("sdas");
              },
              child: const Icon(Icons.menu_book_outlined,size: 35),
            ),
          ),
          SizedBox(height: 20),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: showWidget ? 1.0 : 0.0,
            child: FloatingActionButton(
              heroTag: null,
              backgroundColor: const Color(0xfff28800),
              foregroundColor: Colors.white,
              onPressed: () async {

                SharedPreferences prefs = await SharedPreferences.getInstance();
                int? intValue = prefs.getInt('resumeBook');
                if(intValue != null){
                  print("Test");
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PdfDisplayer(page: intValue,)));
                }

              },
              child: const Icon(Icons.refresh,size: 35),
            ),
          ),
          SizedBox(height: 20),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: showWidget ? 1.0 : 0.0,
            child: FloatingActionButton(
              heroTag: null,
              backgroundColor: const Color(0xfff28800),
              foregroundColor: Colors.white,
              onPressed: () {
                MyNotification notification = MyNotification();
                notification.showSearchBar = true;
                notification..dispatch(context);
              },
              child: const Icon(Icons.search_outlined,size: 35),
            ),
          ),
          SizedBox(height: 20),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: showWidget ? 1.0 : 0.0,
            child: FloatingActionButton(
              heroTag: null,
              backgroundColor: const Color(0xfff28800),
              foregroundColor: Colors.white,
              onPressed: () {
                showDialog(context: context, builder: (_) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  contentPadding: EdgeInsets.only(top: 10.0),
                  content: Container(
                    width: 200,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Row(children: [
                          Expanded(child:Padding(padding: EdgeInsets.fromLTRB(15,0,15,0),child: TextField(
                            onChanged: (value) {

                                try {
                                  nameSurah = int.parse(value);
                                }catch(e){
                                  Toast.show("Digits/Integers only", context, duration: Toast.LENGTH_SHORT);
                                }
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Surah Number:',
                            ),),)),
                          Expanded(child:Padding(padding: EdgeInsets.fromLTRB(15,0,15,0),child: TextField(
                            onChanged: (value) {
                              try {
                                pageSurah = int.parse(value);
                              }catch(e){
                                Toast.show("Digits/Integers only", context, duration: Toast.LENGTH_SHORT);
                              }
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Page Number:',
                            ),),)),
                        ],),

                        Divider(),
                        TextButton(
                          onPressed: (){
                            if(pageSurah >= 0 && nameSurah >= 0){
                              MyNotification notification = MyNotification();
                              notification.surahAdder = true;
                              notification.pageSurah = pageSurah;
                              notification.nameSurah = nameSurah;
                              notification..dispatch(context);
                            }
                          }, child: Container(
                          child: const Padding(

                            padding: EdgeInsets.fromLTRB(8,0,8,4),
                            child: Center(
                              child: Text("Add",style: TextStyle(fontSize: 18),),
                            ),
                          ),
                        ),
                        ),
                      ],
                    ),
                  ),
                  title: Container(
                    child: const Center(

                      child: Text(
                        'Add Surah:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                );
              },
              child: const Icon(Icons.add,size: 35),
            ),
          ),
          SizedBox(height: 20),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: showWidget ? 1.0 : 0.0,
            child: FloatingActionButton(
              heroTag: null,
              backgroundColor: const Color(0xfff28800),
              foregroundColor: Colors.white,
              onPressed: () {
                showDialog(context: context, builder: (_) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  contentPadding: EdgeInsets.only(top: 10.0),
                  content: Container(
                    width: 200,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,

                      children: [


                        Padding(padding: EdgeInsets.fromLTRB(15,0,15,0),child: TextField(
                          onChanged: (value){
                            try {
                              surahBookmark = int.parse(value);
                            }catch(e){
                              Toast.show("Digits/Integers only", context, duration: Toast.LENGTH_SHORT);
                            }
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Surah Number:',
                          ),),),
                        Padding(padding: EdgeInsets.fromLTRB(15,15,15,0),child: TextField(
                          onChanged: (value){
                            try {
                              parahBookmark = int.parse(value);
                            }catch(e){
                              Toast.show("Digits/Integers only", context, duration: Toast.LENGTH_SHORT);
                            }
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Parah Number:',
                          ),),),

                         Padding(padding: EdgeInsets.fromLTRB(15,15,15,0),child: TextField(
                           onChanged: (value){
                             try {
                               pageBookmark = int.parse(value);
                             }catch(e){
                               Toast.show("Digits/Integers only", context, duration: Toast.LENGTH_SHORT);
                             }
                           },
                           decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Page:',
                          ),),),
                          Padding(padding: EdgeInsets.fromLTRB(15,15,15,0),child: TextField(
                          onChanged: (value){
                              titleBookmark = (value);
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Title:',
                          ),),),
                          Padding(padding: EdgeInsets.fromLTRB(15,15,15,0),child: TextField(
                          onChanged: (value){
                            descBookmark = (value);
                          },
                          maxLines: null,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Description:',
                          ),),),
                        Divider(),
                        TextButton(
                          onPressed: () async {
                            DbManager dbManager = new DbManager();
                            MyNotification notification = MyNotification();
                            if(pageBookmark >= 0 ){
                              if(surahBookmark > 0 || parahBookmark > 0){
                                notification.titleBookmark = titleBookmark;
                                notification.descBookmark = descBookmark;
                                notification.surahBookmark = surahBookmark;
                                notification.parahBookmark = parahBookmark;
                                notification.pageBookmark = pageBookmark;
                                notification.bookmarkAdder = true;
                                BookMarkModel __model = await BookMarkModel(
                                    parah: parahBookmark.toString(),
                                    surah: surahBookmark.toString(),
                                    page: pageBookmark,
                                    title: titleBookmark,
                                    desc: descBookmark,
                                   );
                                dbManager.insertModel(__model);
                                notification..dispatch(context);
                              }else {
                                Toast.show("Please enter Page and 1 (Surah or Parah) page",
                                    context, duration: Toast.LENGTH_LONG);
                              }
                            }else{
                              Toast.show("Please enter Page and 1 (Surah or Parah) page",
                                  context, duration: Toast.LENGTH_LONG);
                            }
                          }, child: Container(
                          child: const Padding(

                            padding: EdgeInsets.fromLTRB(8,0,8,4),
                            child: Center(
                              child: Text("Add",style: TextStyle(fontSize: 18),),
                            ),
                          ),
                        ),
                        ),
                      ],
                    ),
                  ),
                  title: Container(
                    child: const Center(

                      child: Text(
                        'Add Surah:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                );
              },
              child: const Icon(Icons.bookmark,size: 35),
            ),
          ),
          SizedBox(height: 20),
      FloatingActionButton(
        backgroundColor: const Color(0xffffae00),
        foregroundColor: Colors.white,
        heroTag: null,
        onPressed: () {
          setState(() {
            if(showWidget){
              showWidget = false;
            }else{
              showWidget = true;
            }

            if (_controller.isDismissed) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
          });
        },
        child:RotationTransition(
          turns: _animation,
          child: const Icon(Icons.expand_circle_down_outlined,size: 35),
        ),

      ),
        ],
      ),
    );
  }
}


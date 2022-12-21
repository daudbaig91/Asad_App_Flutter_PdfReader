
import 'package:asad_quran_app/BookMarkClass.dart';
import 'package:asad_quran_app/DisplayPdf.dart';
import 'package:asad_quran_app/Widgets/FloatingAnimatedButton.dart';
import 'package:asad_quran_app/Widgets/NavigationListViews.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'NotificationClass.dart';
import 'SQLDatabase/database.dart';
import 'Widgets/HomeSearchbar.dart';
import 'Widgets/ListView_Bookmark.dart';

import 'package:sqflite/sqflite.dart';

void main() =>  runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    "/" : (context) => const MyStatefulWidget(),
    "/PdfViewer" : (context) => PdfDisplayer(check: "Parah 1"),
    },
  ));
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {



  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      startLists();
    });

  }

  @override
  void dispose() {
    yourFocusNode.dispose();
    super.dispose();
  }

  void addList(String str){
    setState(() {
      ListData["surah 0"] = 0;
    });

  }

  Future<void> startLists() async {

    DbManager dbManager = new DbManager();

    bookMark = await dbManager.getModelList();


    ListData["Surah 2"] = 2;
    ListData["Surah 10"] = 10;
    ListData["Surah 23"] = 23;
    ListData["Surah 12"] = 12;
    ListData["Surah 4"]= 4;

    for (int i = 1; i <= 30; i++) {
      listparah["Parah $i"] = (i);
    }

  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  FocusNode yourFocusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  int page = 0;
  int _selectedIndex = 0;

  Map<String,int> listparah = {};
  Map<String,int> ListData = {};
  List<BookMarkClass> bookMark = [];

  bool searchBar = false;
  final Color backgroundcolor = const Color.fromARGB(26, 11, 15, 100);

  bool onTitlePush(MyNotification notification) {
    setState(() {
      if(notification.showSearchBar){
        searchBar = !searchBar;
      }else if(notification.surahAdder){
        ListData["Surah " + notification.nameSurah.toString()] = 2;
        ListData["Surah ${notification.pageSurah.toString()}"] = 2;
      }else if(notification.bookmarkAdder){
        bookMark.add(
          BookMarkClass(surah: notification.surahBookmark.toString(),
              parah:  notification.parahBookmark.toString(),
              page:  notification.pageBookmark,
              title:  notification.titleBookmark.toString(),
              desc:  notification.descBookmark.toString(),
            )
        );
      }

    });
    // true meaning processed, no following notification bubbling.
    return true;
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> naviagtionList = <Widget>[];
    naviagtionList.add(Listview1(listparah));
    naviagtionList.add(Listview1(ListData));
    naviagtionList.add(Listview2(bookMark));

    return MaterialApp(

      home: Scaffold(
        backgroundColor: const Color(0xff489855),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: const Color(0xff489855),
            flexibleSpace: SafeArea(
              child: SearchWidget(check: searchBar),
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              FloatingActionButton(onPressed: () async {
                DbManager dbManager = new DbManager();
                dbManager.getModelListlength();
              }, child: Text(
                  "2",
              )),
              naviagtionList.elementAt(_selectedIndex),
              Align(
                alignment: Alignment.bottomRight,
                child: NotificationListener<MyNotification>(onNotification: onTitlePush,
                  child: RotateIcon(bookMark.length),)
              )
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Text(
                  "Parah",
                  style: TextStyle(
                    color: Color(0xffffc200),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                label:"",
              ),
              BottomNavigationBarItem(
                icon: Text(
                  "Surah",
                  style: TextStyle(
                    color: Color(0xffffc200),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                label:"",

              ),
              BottomNavigationBarItem(
                icon: Text(
                  "Bookmark",
                  style: TextStyle(
                    color: Color(0xffffc200),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                label:"",

              ),

            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: _onItemTapped,
            backgroundColor: const Color(0xff489855),
          ),
        ),
      ),
    );
  }

  Future<void> showAlert() async {
    showDialog(context: context,
        builder: (BuildContext context){
          return  AlertDialog(
            title: const Text("Test"),
            content: const Text("This is a test dialog"),
            actions: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: const Text("OK"))
            ],
          );
        }
    );


  }
}



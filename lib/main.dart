

import 'package:asad_quran_app/DisplayPdf.dart';
import 'package:asad_quran_app/Widgets/FloatingAnimatedButton.dart';
import 'package:asad_quran_app/Widgets/NavigationListViews.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';


void main() =>  runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    "/" : (context) => const MyStatefulWidget(),
    "/PdfViewer" : (context) => const PdfDisplayer(),
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
    startLists();
  }
  void addList(String str){
    setState(() {
      ListData["surah 0"] = 0;
    });
  }
  void startLists(){
    ListData["surah 2"] = 2;
    ListData["surah 10"] = 10;
    ListData["surah 23"] = 23;
    ListData["surah 12"] = 12;
    ListData["surah 4"]= 4;

    for (int i = 1; i <= 30; i++) {
      listparah["Parah $i"] = (i);
    }
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;
  bool searchvisible = true;
  bool showWidget = false;
  Map<String,int> listparah = {};
  Map<String,int> ListData = {};
  final Color backgroundcolor = const Color.fromARGB(26, 11, 15, 100);
  String searchValue = "";
  @override
  Widget build(BuildContext context) {

    List<Widget> naviagtionList = <Widget>[];
    naviagtionList.add(Listview1(listparah));
    naviagtionList.add(Listview1(ListData));
    naviagtionList.add(Listview1(ListData));


    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff489855),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: const Color(0xff489855),
            flexibleSpace: SafeArea(
                child: Expanded(
                  child: Text("dssdasd"),
                ),
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              naviagtionList.elementAt(_selectedIndex),
              FloatingActionButton(onPressed: (){
                Navigator.pushNamed(context, "/PdfViewer");
              }),
              const Align(
                alignment: Alignment.bottomRight,
                child: RotateIcon(),
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


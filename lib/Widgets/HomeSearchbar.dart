import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../DisplayPdf.dart';
import '../NotificationClass.dart';


class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key,required this.check}) : super(key: key);

  final bool check;
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  @override
  void initState() {
    print(widget.check);
    searchbar2 = widget.check;
    searchbar1 = !widget.check;
  }


  bool searchbar1 = true;
  bool searchbar2 = false;
  TextEditingController controller = TextEditingController();
  FocusNode yourFocusNode = FocusNode();
  bool checkCall = false;

  @override
  Widget build(BuildContext context) {

    if(!checkCall){
      searchbar1 = !widget.check;
      searchbar2 = widget.check;
    }
    checkCall = false;
    print("sd");

    return Stack(
      children: <Widget>[
        Visibility(
          visible: searchbar1,
          child: ShowUpAnimation(
            direction: Direction.horizontal,
            offset: 0.1,
            animationDuration: Duration(milliseconds: 250),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Expanded(
                  flex: 1,
                  child: ImageIcon(
                    AssetImage('assets/icon.png'),
                    color: Color(0xffffc200),
                    size: 50,
                  ),
                ),
                const Expanded(
                  flex: 5,
                  child: Center(
                    child: Text(
                      "The Noble Quran",
                      style: TextStyle(
                        color: Color(0xffacd7b9),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    iconSize: 26,
                    icon: Icon(Icons.search_sharp),
                    onPressed: () {
                      cahngebool();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: searchbar2,
          child: ShowUpAnimation(
            animationDuration: Duration(milliseconds: 250),
            direction: Direction.horizontal,
            offset: -0.1,
            child: Center(
              child: Padding(

                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: CupertinoSearchTextField(
                  focusNode: yourFocusNode,
                  backgroundColor: Colors.white,
                  suffixMode: OverlayVisibilityMode.always,
                  controller: controller,
                  onChanged: (value) {},
                  autofocus: true,
                  onSuffixTap: () {
                    setState(() {
                      cahngebool();

                    });
                  },
                  onSubmitted: (value) {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PdfDisplayer(page: int.parse(value),)),
                    );
                  },
                  autocorrect: true,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void cahngebool(){
    setState(() {
      checkCall = true;
      searchbar1 = !searchbar1;
      searchbar2 = !searchbar2;
    });
  }
}

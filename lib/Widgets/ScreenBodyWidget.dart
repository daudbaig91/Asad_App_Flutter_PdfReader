import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {

  final String str;

  const CustomListView(this.str);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print(str);
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
                    str.substring(5),
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




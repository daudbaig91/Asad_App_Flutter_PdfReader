import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddSurah extends StatelessWidget {
  const AddSurah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      title: new Text("Alert!!"),
      content: new Text("You are awesome!"),
      actions: <Widget>[
        FloatingActionButton(
          child: new Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

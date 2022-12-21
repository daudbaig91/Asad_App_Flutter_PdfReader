

import 'package:asad_quran_app/Widgets/PdfPagereferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PdfDisplayer extends StatefulWidget {
  const PdfDisplayer({Key? key,name: required, this.check = "", this.page = -1,}) : super(key: key);

  final int page;
  final String check;
  @override
  State<PdfDisplayer> createState() => _PdfDisplayerState();
}

class _PdfDisplayerState extends State<PdfDisplayer> {


  late final pdfController;

  @override
  void initState(){
    pdfController = PdfController(
      document: PdfDocument.openAsset('assets/parahasad.pdf'),
      initialPage: widget.page
    );
    super.initState();
  }
  int page = -1;

  @override
  Widget build(BuildContext context) {
    print("sds");
    PageRef ref = new PageRef();



    if(widget.page!=-1){
      page = widget.page;
      print(widget.page);


    }else if (widget.check != ""){
      page = int.parse(ref.map[widget.check] as String);
    }

    return Scaffold(
        body: Container(
          child: PdfView(
            scrollDirection: Axis.vertical,
            controller: pdfController,
            onPageChanged: (page) async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt('resumeBook',page);
            },
          ),
      ),
    );

  }
}


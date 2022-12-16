

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';


class PdfDisplayer extends StatefulWidget {
  const PdfDisplayer({Key? key}) : super(key: key);

  @override
  State<PdfDisplayer> createState() => _PdfDisplayerState();
}

class _PdfDisplayerState extends State<PdfDisplayer> {


  static const int _initialPage = 2;
  int _actualPageNumber = _initialPage, _allPagesCount = 0;
  bool isSampleDoc = true;

  @override
  void dispose() {

    super.initState();
  }
  final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/parahasad.pdf'),
  );
  @override
  void initState(){
    super.initState();
  }
  String page = "";

  @override
  Widget build(BuildContext context) {




    print("sds");
    //page = (ModalRoute.of(context)!.settings.arguments as Map)["page"];

    return Scaffold(
        body: Container(
          child: PdfView(
            scrollDirection: Axis.vertical,
            controller: pdfController,
          ),
      ),
    );

  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DialogBox.dart';

class RotateIcon extends StatefulWidget {
  const RotateIcon({Key? key}) : super(key: key);

  @override
  _RotateIconState createState() => _RotateIconState();
}

class _RotateIconState extends State<RotateIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

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
  bool showWidget = false;
  @override
  Widget build(BuildContext context) {
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
              onPressed: () {
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


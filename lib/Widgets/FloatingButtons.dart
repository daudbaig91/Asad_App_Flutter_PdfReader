import 'package:flutter/cupertino.dart';

class ButtonsFloat extends StatefulWidget {
  const ButtonsFloat({Key? key}) : super(key: key);

  @override
  State<ButtonsFloat> createState() => _ButtonsFloatState();
}

class _ButtonsFloatState extends State<ButtonsFloat> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainMenuView extends StatefulWidget {
  const MainMenuView({
    Key? key
    }) : super(key:key);

  @override
  State<MainMenuView> createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
  int _activeIndex = 0;

  void _navigateToIndex(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        color: Colors.black,
        child: IndexedStack(
          index: _activeIndex,
          children: <Widget>[
          ],
        ),
      ),
      bottomNavigationBar: Container());
  }
}

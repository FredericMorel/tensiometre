import 'package:flutter/material.dart';
import 'package:tensiometre/view/profil.dart';
import 'package:tensiometre/view/suivi.dart';
import 'package:tensiometre/view/take_pressure.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  final PageController _pageController = PageController();
  int curenScreen = 0;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (v) {
          setState(() {
            widget.curenScreen = v;
          });
        },
        controller: widget._pageController,
        children: [
          TakePressure(
            pressurSubmit: () {
              widget._pageController.jumpToPage(1);
            },
          ),
          Suivi(),
          const Profil(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: widget.curenScreen,
          onTap: (index) {
            widget._pageController.jumpToPage(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.auto_graph), label: "suivi"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "profil"),
          ]),
    );
  }
}

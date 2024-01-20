import 'package:assignment34/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = "/secondPage";

  @override
  State<HomePage> createState() => _MainPageState();
}

class _MainPageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "This is appbar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            backgroundColor: Colors.blue.withOpacity(0.8),
          ),
          body: IndexedStack(
            index: _currentIndex,
            children: [
              CustomTabBar()
            ],
          ),
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
              ),
              SalomonBottomBarItem(
                  icon: Icon(Icons.info), title: Text("Search")),
              SalomonBottomBarItem(
                  icon: Icon(Icons.settings), title: Text("Setting"))
            ],
          ),
        ),
      ),
    );
  }
}

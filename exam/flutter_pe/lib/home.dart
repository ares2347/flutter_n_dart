import 'package:flutter/material.dart';
import 'package:flutter_pe/place_grid.dart';
import 'package:flutter_pe/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.deepPurpleAccent.withOpacity(0.8),
                  toolbarHeight: 150,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(48),
                    ),
                  ),
                  title: const Column(
                    children: [
                      Row(
                        children: [
                          Text("Hi Guy!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      Row(
                        children: [
                          Text("Where are you going next?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200))
                        ],
                      ),
                    ],
                  ),
                ),
                body: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: SearchBar(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: 120,
                              height: 80,
                              color: Colors.orangeAccent.withOpacity(0.6),
                              child: Image(image: AssetImage("assets/images/ico_hotel.png"))),
                          Container(
                              width: 120,
                              height: 80,
                              color: Colors.redAccent.withOpacity(0.6),
                              child: Image(image: AssetImage("assets/images/ico_plane.png"))),
                          Container(
                              width: 120,
                              height: 80,
                              color: Colors.tealAccent.withOpacity(0.6),
                              child: Image(image: AssetImage("assets/images/ico_hotel_plane.png"))),
                        ],
                      ),
                      SizedBox(
                        height: 400,
                        child: PlaceGrid(),
                      )
                    ],
                  ),
                ))));
  }
}

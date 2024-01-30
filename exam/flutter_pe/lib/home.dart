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
                      )
                    ],
                  ),
                ),
                body: PlaceGrid()
            )
        )
    );
  }
}


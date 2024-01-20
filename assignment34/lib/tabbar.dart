import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    TabController _tabController = TabController(length: 3, vsync: this);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.red,
              ),
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(
                        text: "Place",
                      ),
                      Tab(
                        text: "Inspiration",
                      ),
                      Tab(
                        text: "Emotion",
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 250,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Image.network(
                                  width: deviceWidth / 2,
                                  height: 200,
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp4rN33PyWHKh1AnV91DHPLsB-t-FEAjS2eA&usqp=CAU"),
                            ],
                          ),
                          Column(
                            children: [
                              Image.network(
                                  width: deviceWidth / 2,
                                  height: 200,
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp4rN33PyWHKh1AnV91DHPLsB-t-FEAjS2eA&usqp=CAU"),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Image.network(
                                  width: deviceWidth / 2,
                                  height: 200,
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp4rN33PyWHKh1AnV91DHPLsB-t-FEAjS2eA&usqp=CAU"),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Image.network(
                                  width: deviceWidth / 2,
                                  height: 200,
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp4rN33PyWHKh1AnV91DHPLsB-t-FEAjS2eA&usqp=CAU"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

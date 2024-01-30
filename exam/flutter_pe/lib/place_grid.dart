import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pe/place.dart';
import 'package:http/http.dart' as http;

class PlaceGrid extends StatefulWidget {
  const PlaceGrid({super.key});

  @override
  State<PlaceGrid> createState() => _PlaceGridState();
}

class _PlaceGridState extends State<PlaceGrid> {
  Future<List<Place>> fetchData() async {
    String url = "http://10.0.2.2:8080/api/place/list";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        return data.map((e) => Place.valueFromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
              body: FutureBuilder<List<Place>>(
                  future: fetchData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Place>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Text("No data available!");
                      case ConnectionState.waiting:
                      case ConnectionState.active:
                        return const Center(child: CircularProgressIndicator());
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return const Text("Error while fetching data!");
                        } else if (snapshot.data == null ||
                            snapshot.data!.isEmpty) {
                          return const Text("No data available!");
                        } else {
                          return LayoutBuilder(builder: (context, constraint) {
                            return Container(
                              height: constraint.maxHeight,
                              child: CustomScrollView(
                                primary: false,
                                slivers: <Widget>[
                                  SliverPadding(
                                    padding: const EdgeInsets.all(20),
                                    sliver: SliverGrid.count(
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      crossAxisCount: 2,
                                      children: <Widget>[
                                        ...snapshot.data!.map((element) {
                                          return Container(
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage("assets/images/default.jpg"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            padding: const EdgeInsets.all(8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                      size: 24.0,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        element.name.toString(),
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 5)),
                                                    Text(
                                                        element.rating
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        })
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                        }
                    }
                  }))),
    );
  }
}

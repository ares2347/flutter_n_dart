import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'employee.dart';

class CustomTable extends StatefulWidget {
  static const String routeName = "/";

  const CustomTable({super.key});

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  Future<List<Employee>> fetchData() async {
    String url = "http://localhost:8080/employee/list";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        return data.map((e) => Employee.valueFromJson(e)).toList();
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
              body: FutureBuilder<List<Employee>>(
        future: fetchData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text("No data available!");
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return const Text("Error while fetching data!");
              } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                return const Text("No data available!");
              } else {
                return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(bottom: 8),
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/form');
                                    },
                                    child: const Text("Add new")),
                              )
                            ]),
                        Table(
                          border: TableBorder.all(width: 1),
                          children: [
                            const TableRow(children: [
                              TableCell(
                                  child:
                                      Text("No.", textAlign: TextAlign.center)),
                              TableCell(
                                  child: Text("Name",
                                      textAlign: TextAlign.center)),
                              TableCell(
                                  child: Text("Gender",
                                      textAlign: TextAlign.center)),
                              TableCell(
                                  child: Text("Phone",
                                      textAlign: TextAlign.center)),
                              TableCell(
                                  child: Text("Email",
                                      textAlign: TextAlign.center))
                            ]),
                            ...snapshot.data!.map((element) {
                              return TableRow(children: [
                                TableCell(
                                    child: Text(
                                        snapshot.data!.indexOf(element).toString(),
                                        textAlign: TextAlign.center)),
                                TableCell(
                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Text(element.name ?? ""))),
                                TableCell(
                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Text(element.gender ?? ""))),
                                TableCell(
                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Text(element.phone ?? ""))),
                                TableCell(
                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Text(element.email ?? "")))
                              ]);
                            })
                          ],
                        )
                      ],
                    ));
              }
          }
        },
      ))),
    );
  }
}

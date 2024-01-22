import 'dart:convert';

import 'package:assignment_slot_12/employee.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomForm extends StatefulWidget {
  static const String routeName = "/form";

  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  String _gender = "Male";
  final String _title = "Add new employee";

  Future<List<Employee>> postData(Employee employee) async {
    String url = "http://localhost:8080/employee/add";
    try {
      final response = await http.post(Uri.parse(url), body: jsonEncode(employee));
      if (response.statusCode == 200) {
        Navigator.pushNamed(context, '/');
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
            body: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child:
                            Text(_title, style: const TextStyle(fontSize: 24)),
                      ),
                      TextFormField(
                        controller: _nameController,
                        decoration:
                            const InputDecoration(hintText: "Employee Name"),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "This field can not be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text("Male"),
                          Radio(
                              value: "Male",
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value ?? "";
                                });
                              }),
                          const Text("Female"),
                          Radio(
                              value: "Female",
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value ?? "";
                                });
                              })
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _addressController,
                        decoration: const InputDecoration(hintText: "Address"),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "This field can not be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _phoneController,
                        decoration:
                            const InputDecoration(hintText: "Phone Number"),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "This field can not be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(hintText: "Email"),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "This field can not be empty";
                          }
                          return null;
                        },
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                child: const Text("Back"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Employee employee = Employee(
                                        name: _nameController.text,
                                        address: _addressController.text,
                                        email: _emailController.text,
                                        gender: _gender,
                                        phone: _phoneController.text);
                                    postData(employee);
                                  }
                                },
                                child: const Text("Submit"),
                              ),
                            ],
                          ))
                    ],
                  ),
                )),
          ),
        ));
  }
}

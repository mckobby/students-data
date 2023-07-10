import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_acapella/models/student_models.dart';
import 'package:json_acapella/student_details.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  List _items = [];

  Future readJson() async {
    String response = await rootBundle.loadString("assets/l_j_files.json");
    final data = await jsonDecode(response);

    setState(() {
      _items = data["items"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        title: const Text(
          'Students',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      ),
      body: _items.isNotEmpty
          ? ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final student = _items[index];
                final name = student["name"];
                final profile = student["profile"];
                final age = student["age"];
                final photo = student["photo"];
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => StudentDetails(
                            studentModels: StudentModels(
                              sName: name,
                              sProfile: profile,
                              sAge: age,
                              sPhoto: photo,
                            ),
                          ),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      radius: height * 0.04,
                      backgroundImage: NetworkImage(photo),
                    ),
                    title: Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      profile,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text("${age}yrs"),
                  ),
                );
              },
            )
          : const Center(
              child: Text('No data'),
            ),
    );
  }
}

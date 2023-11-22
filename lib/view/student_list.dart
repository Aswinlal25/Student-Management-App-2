import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_app1/provider/list_provider.dart';
import 'package:my_app1/view/student_details.dart';
import 'package:provider/provider.dart';
import 'package:my_app1/core/constrains.dart';
import 'package:my_app1/view/add_student.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor:primaryclr,
        title: !homeProvider.isSearching
            ? const Text('Student List', style: titletxt)
            : TextField(
                style: const TextStyle(color: Colors.white),
                onChanged: (query) {
                  homeProvider.filterStudents(query);
                },
                decoration: const InputDecoration(
                  hintText: 'Search student here',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.white70,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              homeProvider.toggleSearch();
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: homeProvider.filteredStudents.isEmpty
          ? const Center(
              child: Text(
                'No students found.',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 4,
                    wordSpacing: 5),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: homeProvider.filteredStudents.length,
              itemBuilder: (context, index) {
                final student = homeProvider.filteredStudents[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StudentDetailspage(student: student),
                      ),
                    ).then((value) => homeProvider.refreshStudentList());
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              FileImage(File(student.profilePicturePath)),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          student.name,
                          style: const TextStyle(
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddStudentScreen()))
              .then((value) => homeProvider.refreshStudentList());
        },
        backgroundColor:primaryclr,
        child: const Icon(Icons.add),
      ),
    );
  }
}
 
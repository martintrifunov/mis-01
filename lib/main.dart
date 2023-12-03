import 'package:flutter/material.dart';
import '../model/course.dart';
import '../constants/colors.dart';
import '../widgets/course_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MIS Lab 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '193254 Martin Trifunov :)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final courseList = Course.courseList();
  final _courseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBlue,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
             Expanded(child: ListView(
               children: [
                 Container(
                   margin: EdgeInsets.only(top: 50, bottom: 50),
                   child: Text('All Courses', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                 ),
                 for(Course course in courseList)
                   CourseItem(course: course, onDeleteItem: _deleteCourseItem),
               ],
              )
             )
            ]
          ),
        ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                      ),],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                      controller: _courseController,
                      decoration: InputDecoration(
                        hintText: 'Add a new course',
                        border: InputBorder.none
                      ),
                    ),
                  )
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text('+', style: TextStyle(fontSize: 40, color: Colors.white)),
                  onPressed: () {_addCourseItem(_courseController.text);},
                  style: ElevatedButton.styleFrom(
                    primary: tdBlue,
                    minimumSize: Size(60, 60),
                    elevation: 10
                  ),
                ),
              )
            ]
              ,)
            ,)
        ]
      )
    );
  }
  void _deleteCourseItem(String id) {
    setState(() {
      courseList.removeWhere((item) => item.id == id);
    });
  }
  void _addCourseItem(String courseTile) {
    setState(() {
      courseList.add(Course(id: DateTime
          .now()
          .microsecondsSinceEpoch
          .toString(), courseTitle: courseTile));
    });
    _courseController.clear();
  }
}



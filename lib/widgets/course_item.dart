import 'package:flutter/material.dart';
import 'package:mis_01/constants/colors.dart';
import 'package:mis_01/model/course.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  final onDeleteItem;

  const CourseItem({
    Key? key,
    required this.course,
    required this.onDeleteItem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:   EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white ,
        title: Text(course.courseTitle!),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(course.id);
            },
          ),
        ),
      ),
    );
  }
}
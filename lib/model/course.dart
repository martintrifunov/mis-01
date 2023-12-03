class Course {
  String? id;
  String? courseTitle;

  Course({required this.id, required this.courseTitle});

  static List<Course> courseList() {
    return [
      Course(id: '1', courseTitle: 'Databases'),
      Course(id: '2', courseTitle: 'Web Programming'),
      Course(id: '3', courseTitle: 'Mobile Information Systems')
    ];
  }
}
abstract class Student_States {}

class Student_Init extends Student_States {}
class Student_Change_NavBar extends Student_States {}

class Get_courses extends Student_States {}
class Get_courses_Loading extends Student_States {}
class Get_courses_error extends Student_States {
  final String error ;
  Get_courses_error(this.error);
}

class Get_profile extends Student_States {}
class Get_profile_Loading extends Student_States {}
class Get_profile_error extends Student_States {
  final String error ;
  Get_profile_error(this.error);
}


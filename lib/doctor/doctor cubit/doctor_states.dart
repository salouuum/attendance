abstract class Doctor_States {}

class Doctor_Init extends Doctor_States {}

class Doctor_Change_NavBar extends Doctor_States {}

class Get_courses extends Doctor_States {}
class Get_courses_Loading extends Doctor_States {}
class Get_courses_error extends Doctor_States {
  final String error ;
  Get_courses_error(this.error);
}

class Doctor_Get_profile extends Doctor_States {}
class Doctor_Get_profile_Loading extends Doctor_States {}
class Doctor_Get_profile_error extends Doctor_States {
  final String error;

  Doctor_Get_profile_error(this.error);
}


class Doctor_Get_reports extends Doctor_States {}
class Doctor_Get_reports_Loading extends Doctor_States {}
class Doctor_Get_reports_error extends Doctor_States {
  final String error;

  Doctor_Get_reports_error(this.error);
}

class Doctor_Get_warnings extends Doctor_States {}
class Doctor_Get_warnings_Loading extends Doctor_States {}
class Doctor_Get_warnings_error extends Doctor_States {
  final String error;

  Doctor_Get_warnings_error(this.error);
}

class Doctor_Accept_report extends Doctor_States {}
class Doctor_Accept_report_error extends Doctor_States {
  final String error;

  Doctor_Accept_report_error(this.error);
}
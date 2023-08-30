
import 'package:attendence_sfe/doctor/doctor%20cubit/doctor_states.dart';
import 'package:attendence_sfe/doctor/reports.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Doctor_profile.dart';
import '../doctor_home_sub.dart';

class Doctor_Cubit extends Cubit<Doctor_States> {
  Doctor_Cubit() : super(Doctor_Init());

  static Doctor_Cubit get(context) => BlocProvider.of(context);

  int i = 1;
  List<dynamic>? courses_data;

  List<dynamic>? reports_data;
  Map<String, dynamic>? warnings;

  Map<String, dynamic>? profile_data;

  TextEditingController email_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();
  String baseurl = 'http://192.168.43.50:3000';

  List<Widget> screens = [
    Doctor_ProfileScreen(),
    Doctor_Home_sub(),
    Reports(),
  ];

  void change_index(int index) {
    i = index;
    emit(Doctor_Change_NavBar());
  }

  Future<Response> doctor_auth(String email, String naId) async {
    final dio = Dio();
    // Replace with your API URL
    final apiUrl = '$baseurl/instructor/$email/$naId';
    final response = await dio.get('$apiUrl');
    saveprefs('doctorId', response.data['instructorId'].toString());
    print(response.data);
    return response;
  }

  void saveprefs(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
  Future<void> get_courses_data() async {
    emit(Get_courses_Loading());
    final dio = Dio();
    // Replace with your API URL
    String? id = await getprefs('doctorId');
    final apiUrl = '$baseurl/instructor/$id/courses-info';
    await dio.get('$apiUrl').then((value) {
      courses_data = value.data;
      print(courses_data);
      emit(Get_courses());
    }).catchError((error) {
      print(error);
      emit(Get_courses_Loading());
    });
  }
  Future<void> get_profile_data() async {
    emit(Doctor_Get_profile_Loading());
    final dio = Dio();
    // Replace with your API URL
    String? id = await getprefs('doctorId');
    final apiUrl = '$baseurl/instructor/$id/summary';
    await dio.get('$apiUrl').then((value) {
      profile_data = value.data;
      print(profile_data);
      emit(Doctor_Get_profile());
    }).catchError((error) {
      print(error);
      emit(Doctor_Get_profile_Loading());
    });
  }
  Future<void> get_reports_data() async {
    emit(Doctor_Get_reports_Loading());
    final dio = Dio();
    // Replace with your API URL
    String? id = await getprefs('doctorId');
    final apiUrl = '$baseurl/reports/$id/illness-reports';
    await dio.get('$apiUrl').then((value) {
      reports_data = value.data;
      print(reports_data);
      emit(Doctor_Get_reports());
    }).catchError((error) {
      print(error);
      emit(Doctor_Get_reports_Loading());
    });
  }
  Future<void> accept_report(BuildContext context, report_id) async {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Center(
                child: Text(
                  'Respond to Report',
                  style: TextStyle(color: Colors.white),
                )),
            backgroundColor: Colors.grey.shade900,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            icon: Icon(
              Icons.note_alt_outlined, color: Colors.white, size: 100,),
            actions: [
              FloatingActionButton.extended(
                onPressed: () async {
                  final dio = Dio();
                  // Replace with your API URL
                  final apiUrl = '$baseurl/confirm-illness-report/$report_id';
                  await dio.put('$apiUrl').then((value) {
                    print(3333);
                    Navigator.pop(context);
                    emit(Doctor_Accept_report());
                  }).catchError((error) {
                    print(error);
                    emit(Doctor_Accept_report_error(
                      error
                    ));
                  });
                },
                label: Text(
                  'Accept',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade900,
                      fontSize: 20
                  ),

                ),
                backgroundColor: Colors.greenAccent,
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          ),
    );
  }
  Future<void> downloadFile(course_id) async {
    final String fileUrl = '$baseurl/course/$course_id/attendance/download';
    await launch(fileUrl);
  }
  void cleaerprefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
  Future<String?> getprefs(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? prefstring = prefs.getString(key);
    return prefstring;
  }
}
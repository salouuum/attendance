import 'package:attendence_sfe/student/student%20cubit/student_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../student_home_sub.dart';
import '../sutdent_profile.dart';


class Student_Cubit extends Cubit<Student_States>{
  Student_Cubit() : super(Student_Init());
  static Student_Cubit get(context) => BlocProvider.of(context);
   int i = 1;
   List<Widget> screens = [
    Student_ProfileScreen(),
    Student_Home_Sub(),
  ];
   List<dynamic>? courses_data ;
  Map<String , dynamic>? profile_data ;
  TextEditingController email_controller = TextEditingController();
  TextEditingController execuse_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();
  String baseurl = 'http://192.168.43.50:3000';
  var date = DateTime.now().toString();
  String execuse = ' ';
  void change_index (int index){
    i = index ;
    emit(Student_Change_NavBar());
  }
  Future<Response> student_auth(String email, String naId) async {
    final dio = Dio();
    // Replace with your API URL
    final apiUrl = '$baseurl/student/$email/$naId';
    final response = await dio.get('$apiUrl');
    saveprefs('studentId',response.data['studentId'].toString() );
    return response;
  }
  Future<void> get_courses_data() async {
    emit(Get_courses_Loading());
    final dio = Dio();
    // Replace with your API URL
    String? id = await getprefs('studentId');
    final apiUrl = '$baseurl/student-summary/$id';
     await dio.get('$apiUrl').then((value)
     {
       courses_data = value.data ;
       print(courses_data);
       emit(Get_courses());
     }).catchError((error){
       print(error);
       emit(Get_courses_Loading());
     });
  }
  Future<void> get_profile_data() async {
    emit(Get_profile_Loading());
    final dio = Dio();
    // Replace with your API URL
    String? id = await getprefs('studentId');
    final apiUrl = '$baseurl/student/$id/data';
    await dio.get('$apiUrl').then((value)
    {
      profile_data = value.data ;
      print(profile_data);
      emit(Get_profile());
    }).catchError((error){
      print(error);
      emit(Get_profile_Loading());
    });
  }
  void saveprefs( key , value)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);

  }
  void cleaerprefs( )async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
  Future<String?> getprefs(key)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? prefstring = prefs.getString(key);
    return prefstring ;
  }
  Future<void> open_dialog(BuildContext context , course_id)async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(
        child: Text(
          'Give your Execuse',
          style: TextStyle(color: Colors.white),
        )),
          backgroundColor: Colors.grey.shade900,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          content: Column(
           mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Give an Execuse',
                  labelStyle: TextStyle(
                      color: Colors.white
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                controller: execuse_controller,
                autofocus: true,

              ),
              SizedBox(height: 15,),
              Container(
                width: double.infinity,
                child: FloatingActionButton.extended(
                  onPressed: (){
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2050),
                    ).then((value) => date = value!.toString());
                  },
                  label: Text(
                    'pick lecture\'s date',
                    style:TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade900,
                        fontSize: 15
                    ) ,

                  ) ,
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
          icon: Icon(Icons.note_alt_outlined , color: Colors.white,size: 100,),
          actions: [
            FloatingActionButton.extended(
                onPressed: ()async{
                  final dio = Dio();
                  // Replace with your API URL
                  String? id = await getprefs('studentId');
                  final apiUrl = '$baseurl/illness-report?ssn=${id}&co_id=${course_id}&date_of_absent=${date}&report_text=${execuse_controller.text}';
                  await dio.post('$apiUrl').then((value)
                  {
                    print(123);
                    Navigator.pop(context);
                  }).catchError((error){
                    print(error);
                  });

                },
                label: Text(
                  'Submit',
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900,
                    fontSize: 20
                  ) ,

                ) ,
              backgroundColor: Colors.white,
            ),
          ],
    ),
    );

  }

}
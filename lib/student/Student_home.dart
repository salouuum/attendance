import 'package:attendence_sfe/doctor/Doctor_profile.dart';
import 'package:attendence_sfe/doctor/Doctor_login.dart';
import 'package:attendence_sfe/student/student%20cubit/student_cubit.dart';
import 'package:attendence_sfe/student/student%20cubit/student_states.dart';
import 'package:attendence_sfe/student/student_home_sub.dart';
import 'package:attendence_sfe/student/sutdent_profile.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Student_Home extends StatelessWidget {
  const Student_Home({super.key});



  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (BuildContext context) => Student_Cubit(),
      child: BlocConsumer<Student_Cubit, Student_States>(
        builder: (context, Student_States state) {
          return WillPopScope(
            onWillPop: () async => false ,
            child: Scaffold(
              body: ConditionalBuilder(
               condition: true,
                builder:(context)=> SafeArea(
                  child: Student_Cubit.get(context).screens[Student_Cubit.get(context).i],
                ),
                fallback: (BuildContext context) => Center(child: CircularProgressIndicator(color: Colors.blueAccent,),),
              ),
              bottomNavigationBar: CurvedNavigationBar(
                animationDuration: Duration(milliseconds: 250),
                animationCurve: Curves.easeIn,
                height: 60,
                buttonBackgroundColor: Colors.grey.shade900,
                items: [
                  Icon(Icons.person_outline, size: 30, color: Colors.white,),
                  Icon(Icons.home_outlined, size: 30, color: Colors.white,),
                ],
                backgroundColor: Colors.grey.shade700,
                color: Colors.grey.shade900,
                index: Student_Cubit.get(context).i,
                onTap: (index) {

                  Student_Cubit.get(context).change_index(index);
                },
              ),
            ),
          );
        },
        listener: (context, Student_States state) {},
      ),
    );
  }
}

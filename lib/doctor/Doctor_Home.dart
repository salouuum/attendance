import 'package:attendence_sfe/doctor/Doctor_profile.dart';
import 'package:attendence_sfe/doctor/doctor%20cubit/doctor_cubit.dart';
import 'package:attendence_sfe/doctor/doctor%20cubit/doctor_states.dart';
import 'package:attendence_sfe/doctor/doctor_home_sub.dart';
import 'package:attendence_sfe/doctor/Doctor_login.dart';
import 'package:attendence_sfe/student/sutdent_profile.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Doctor_Home extends StatelessWidget {
  const Doctor_Home({super.key});
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => Doctor_Cubit(),
      child: BlocConsumer<Doctor_Cubit , Doctor_States>(
          builder: (context , Doctor_States state){
            Doctor_Cubit doc = Doctor_Cubit.get(context);
            return WillPopScope(
              onWillPop: () async => false ,
              child: Scaffold(
                body:ConditionalBuilder(
                  condition: doc.screens.length > 0,
                  builder: (context)=>SafeArea(
                    child: doc.screens[doc.i],
                  ),
                  fallback: (context)=>Center(child: CircularProgressIndicator(color: Colors.lightBlueAccent,),) ,
                ) ,
                bottomNavigationBar: CurvedNavigationBar(
                  animationDuration: Duration(milliseconds: 250),
                  animationCurve: Curves.easeIn,
                  height: 65,
                  buttonBackgroundColor: Colors.grey.shade900,
                  items: <Widget>[
                    Icon(Icons.person_outline, size: 30 , color:Colors.white ,),
                    Icon(Icons.home_outlined, size: 30,color: Colors.white,),
                    Icon(Icons.report_gmailerrorred_outlined,size: 30 ,color: Colors.white,),
                  ],
                  backgroundColor: Colors.grey.shade700,
                  color: Colors.grey.shade900,
                  index: doc.i,
                  onTap: (index) {
                    doc.change_index(index);

                  },
                ),
              ),
            );
          },
          listener: (context , Doctor_States state){},
      ),
    );
  }
}

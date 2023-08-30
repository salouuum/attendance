import 'package:attendence_sfe/doctor/Course_Attendence.dart';
import 'package:attendence_sfe/doctor/doctor%20cubit/doctor_cubit.dart';
import 'package:attendence_sfe/doctor/doctor%20cubit/doctor_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Doctor_Home_sub extends StatelessWidget {
  const Doctor_Home_sub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context)=>Doctor_Cubit()..get_courses_data(),
        child: BlocConsumer<Doctor_Cubit , Doctor_States>(
          listener:(context , Doctor_States state){} ,
          builder:(context , Doctor_States state){
            var cubit = Doctor_Cubit.get(context);
            return  Scaffold(
              body: ConditionalBuilder(
                condition: state is! Get_courses_Loading,
                builder: (BuildContext context) => SafeArea(
                    child:Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index)=>GestureDetector(
                          onTap: (){
                            cubit.downloadFile(cubit.courses_data![index]['co_id']);
                            print(1);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade900,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 1.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15.0),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [Colors.grey.shade900, Colors.grey.shade700]),
                              ),
                              width: double.infinity,
                              child: Padding(
                                padding:  EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${cubit.courses_data![index]['co_name']}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 28 ,
                                      ),
                                      overflow: TextOverflow.clip,
                                    ),
                                    Text(
                                      'Tap to download attendance',
                                      style: TextStyle(
                                          color: Colors.white
                                      ),

                                    ),
                                    SizedBox(height: 15,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Icon(Icons.person_outline , color: Colors.white,),
                                              SizedBox(height: 15,),
                                              Text(
                                                'Total' ,
                                                style: TextStyle(fontWeight: FontWeight.w900 , color: Colors.white , fontSize: 18),
                                              ),
                                              SizedBox(height: 5,),
                                              Text(
                                                '${cubit.courses_data![index]['numStudents']}' ,
                                                style: TextStyle( color: Colors.white , fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 15,),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Icon(Icons.clear_outlined , color: Colors.white,),
                                              SizedBox(height: 15,),
                                              Text(
                                                'Suspended' ,
                                                style: TextStyle(fontWeight: FontWeight.w900 , color: Colors.white , fontSize: 18),
                                              ),
                                              SizedBox(height: 5,),
                                              Text(
                                                '${cubit.courses_data![index]['numSuspendedStudents']}' ,
                                                style: TextStyle( color: Colors.white , fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 15,),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index)=> SizedBox(height: 1.0,),
                        itemCount: cubit.courses_data!.length,
                      ),
                    )
                ),
                fallback: (BuildContext context)=>Center(child: CircularProgressIndicator(color: Colors.white,),),
              ),
            );
          } ,
        ),
      ),
    );
  }
}

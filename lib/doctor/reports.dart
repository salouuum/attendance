
import 'package:attendence_sfe/doctor/doctor%20cubit/doctor_cubit.dart';
import 'package:attendence_sfe/doctor/doctor%20cubit/doctor_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Reports extends StatelessWidget {
  const Reports({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => Doctor_Cubit()..get_reports_data(),
      child: BlocConsumer<Doctor_Cubit , Doctor_States>(
        listener: (context , Doctor_States state){},
        builder:(context , Doctor_States state){
          var cubit = Doctor_Cubit.get(context);
          return  Scaffold(
            body: ConditionalBuilder(
                condition: state is! Doctor_Get_reports_Loading,
                builder: (context){
                  return SafeArea(
                      child:Padding(
                        padding:  EdgeInsets.all(10.0),
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index)=>GestureDetector(
                            onTap: (){
                              print('${cubit.reports_data![index]['report_id']}');
                              print(1);
                              cubit.accept_report(context, cubit.reports_data![index]['report_id']);
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
                                        '${cubit.reports_data![index]['co_name']}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 28 ,
                                        ),
                                        overflow: TextOverflow.clip,
                                      ),
                                      SizedBox(height: 15,),
                                      Text(
                                        'Student Name : ${cubit.reports_data![index]['student_name']}',
                                        style: TextStyle(
                                            color: Colors.white
                                        ),

                                      ),
                                      SizedBox(height: 15,),
                                      Text(
                                        'Student ID : ${cubit.reports_data![index]['ssn']}',
                                        style: TextStyle(
                                            color: Colors.white
                                        ),

                                      ),
                                      SizedBox(height: 15,),
                                      Text(
                                        'Date : ${cubit.reports_data![index]['date_of_absent']}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          overflow: TextOverflow.clip,
                                        ),

                                      ),
                                      SizedBox(height: 15,),
                                      Text(
                                        'Execuse : ${cubit.reports_data![index]['report_text']}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          overflow: TextOverflow.clip,
                                        ),

                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index)=> SizedBox(height: 1.0,),
                          itemCount: cubit.reports_data!.length,
                        ),
                      )
                  );
                },
                fallback: (context)=>Center(child: CircularProgressIndicator(color: Colors.white,),),
            ),
          );
        } ,
      ),
    );
  }
}

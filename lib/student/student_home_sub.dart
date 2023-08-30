import 'package:attendence_sfe/student/student%20cubit/student_cubit.dart';
import 'package:attendence_sfe/student/student%20cubit/student_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Student_Home_Sub extends StatelessWidget {
  const Student_Home_Sub({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => Student_Cubit()..get_courses_data(),
      child: BlocConsumer<Student_Cubit , Student_States>(
        listener: (context , Student_States state){},
        builder: (context , Student_States state){
          var cubit = Student_Cubit.get(context);
          return Scaffold(
            body: ConditionalBuilder(
              condition: state is! Get_courses_Loading ,
              builder:(context)=> SafeArea(
                  child:Padding(
                    padding:  EdgeInsets.all(10.0),
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index)=>Padding(
                        padding: EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            print(1);
                            cubit.open_dialog(context , cubit.courses_data![index]['co_id']);
                            },
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
                                  blurRadius: 7.0,
                                  spreadRadius: 0.8,
                                )
                              ],
                              borderRadius: BorderRadius.circular(15.0),
                              //color: Colors.white,
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [Colors.grey.shade900, Colors.grey.shade700,]),

                            ),
                            width: double.infinity,
                            child:  Padding(
                              padding: EdgeInsets.all(15.0),
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
                                    'Tab to give absent execuse',
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
                                            Column(
                                              children: [
                                                Icon(Icons.cancel_presentation_outlined , color: Colors.white,),
                                                Text(
                                                  'absent' ,
                                                  style: TextStyle(fontWeight: FontWeight.w900 , color: Colors.white , fontSize: 20),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            Text(
                                              '${cubit.courses_data![index]['total_absent']}' ,
                                              style: TextStyle( color: Colors.white , fontSize: 18),
                                            ),

                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 15,),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Column(
                                              children: [
                                                Icon(Icons.check_circle_outline , color: Colors.white,),
                                                Text(
                                                  'Status' ,
                                                  style: TextStyle(fontWeight: FontWeight.w900 , color: Colors.white , fontSize: 20),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            Text(
                                              '${cubit.courses_data![index]['status']}' ,
                                              style: TextStyle( color: Colors.white , fontSize: 18),
                                            ),

                                          ],
                                        ),
                                      ),
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
              fallback: (BuildContext context) => Center(child: CircularProgressIndicator(color: Colors.grey.shade900,),),
            ),
          );
        },
      ),
    );
  }
}

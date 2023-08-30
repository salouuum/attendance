
import 'package:attendence_sfe/Welcome.dart';
import 'package:attendence_sfe/student/student%20cubit/student_cubit.dart';
import 'package:attendence_sfe/student/student%20cubit/student_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Student_ProfileScreen extends StatelessWidget {
  const Student_ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> Student_Cubit()..get_profile_data(),
      child: BlocConsumer<Student_Cubit , Student_States>(
          builder: (context , Student_States state){
            var cubit = Student_Cubit.get(context);
            return Scaffold(
              body: ConditionalBuilder(
                  condition: state is! Get_profile_Loading,
                  builder: (context){
                    return SafeArea(
                      child: Padding(
                        padding:  EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 50,),
                              Center(
                                child: Container(

                                  width: 150,
                                  height: 150,
                                  decoration:  BoxDecoration(
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
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [Colors.grey.shade900, Colors.grey.shade700,]),
                                    color: Colors.grey.shade900,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.school_outlined ,size: 130,color: Colors.white,),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                '${cubit.profile_data!['student']['student_name']}',
                                 style: TextStyle(
                                   color: Colors.white ,
                                   fontWeight: FontWeight.bold ,
                                   fontSize: 20
                                 ),
                              ),
                              SizedBox(height: 20,),
                              Container(

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
                                      colors: [Colors.grey.shade900, Colors.grey.shade700,]),
                                ),
                                width: double.infinity,

                                child: Padding(
                                  padding:  EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Student\'s Information',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 30 ,
                                        ),
                                      ),
                                      SizedBox(height: 15,),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.perm_identity_outlined , color: Colors.white,),
                                              SizedBox(width: 5,),
                                              Text(
                                                'ID :' ,
                                                style: TextStyle(fontWeight: FontWeight.w900 , color: Colors.white , fontSize: 18),
                                              ),
                                              SizedBox(width: 5,),
                                              Text(
                                                '${cubit.profile_data!['student']['ssn']}',
                                                style:TextStyle( color: Colors.white , fontSize: 14) ,
                                              )
                                            ],
                                          ),
                                          SizedBox(width: 30,),
                                          Row(
                                            children: [
                                              Icon(Icons.stairs_outlined , color: Colors.white,),
                                              SizedBox(width: 5,),
                                              Text(
                                                'Level :' ,
                                                style: TextStyle(fontWeight: FontWeight.w900 , color: Colors.white , fontSize: 18),
                                              ),
                                              SizedBox(width: 5,),
                                              Text(
                                                '${cubit.profile_data!['student']['st_year']}',
                                                style:TextStyle( color: Colors.white , fontSize: 14) ,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.credit_card_outlined , color: Colors.white,),
                                              SizedBox(width: 5,),
                                              Text(
                                                'National ID :' ,
                                                style: TextStyle(fontWeight: FontWeight.w900 , color: Colors.white , fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 5,),
                                          Text(
                                            '${cubit.profile_data!['student']['na_id']}',
                                            style:TextStyle( color: Colors.white , fontSize: 14) ,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.app_registration_outlined , color: Colors.white,),
                                              SizedBox(width: 5,),
                                              Text(
                                                'E-Mail :' ,
                                                style: TextStyle(fontWeight: FontWeight.w900 , color: Colors.white , fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 5,),
                                          Text(
                                            '${cubit.profile_data!['student']['email']}',
                                            style:TextStyle( color: Colors.white , fontSize: 14) ,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 30,),
                              Container(
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
                                      colors: [Colors.grey.shade900, Colors.grey.shade700,]),
                                ),
                                width: double.infinity,

                                child:  Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Student\'s Stats',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 30 ,
                                        ),
                                      ),
                                      SizedBox(height: 15,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Icon(Icons.app_registration_outlined , color: Colors.white,size: 40,),
                                                SizedBox(height: 5,),
                                                Text(
                                                  'Registered' ,
                                                  style: TextStyle(fontWeight: FontWeight.w900 , color: Colors.white , fontSize: 18),
                                                ),
                                                Text(
                                                  '${cubit.profile_data!['enrolledCourses']}' ,
                                                  style: TextStyle( color: Colors.white , fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 20,),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Icon(Icons.clear_outlined , color: Colors.white,size: 40,),
                                                SizedBox(width: 5,),
                                                Text(
                                                  'suspended' ,
                                                  style: TextStyle(fontWeight: FontWeight.w900 , color: Colors.white , fontSize: 18),
                                                ),
                                                SizedBox(width: 5,),
                                                Text(
                                                  '${cubit.profile_data!['suspendedCourses']}',
                                                  style:TextStyle( color: Colors.white , fontSize: 18) ,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  fallback: (context)=>Center(child: CircularProgressIndicator(color: Colors.white,),),
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed:(){
                  cubit.cleaerprefs();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Welcome()));
                },
                label: Text(
                  'log out' ,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                icon: Icon(Icons.logout_outlined , color: Colors.white,),
                backgroundColor: Colors.redAccent,
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

            );
          },
          listener: (context , Student_States state){}
      ),
    );
  }
}


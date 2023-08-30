

import 'package:attendence_sfe/student/Student_home.dart';
import 'package:attendence_sfe/student/student%20cubit/student_cubit.dart';
import 'package:attendence_sfe/student/student%20cubit/student_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../doctor/Doctor_Home.dart';

class Student_Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create:(context ) => Student_Cubit(),
      child: BlocConsumer<Student_Cubit , Student_States>(
          builder: (context , Student_States state) {
            return  Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 50.0,),
                        Image(
                          image: AssetImage('Assets/logo.png'),
                          fit: BoxFit.fill,
                          width: 300,
                          height: 200,
                        ),
                        SizedBox(height: 30.0,),
                        Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35.0,
                              color: Colors.white
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        Text(
                          'Use your E-mail and your Password to log in',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            labelStyle: TextStyle(
                                color: Colors.white
                            ),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: Student_Cubit.get(context).email_controller,
                        ),
                        SizedBox(height: 15.0,),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Password ( Default : Your National ID)',
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          controller: Student_Cubit.get(context).pass_controller,
                          obscureText: true,
                        ),
                        SizedBox(height: 20.0,),
                        Container(
                          width: double.infinity,
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
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.lightBlueAccent,
                              gradient: LinearGradient(
                                  colors: [Colors.grey.shade900,Colors.grey.shade700],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight
                              )
                          ),
                          child: MaterialButton(
                            onPressed: (){
                              Student_Cubit.get(context).student_auth(
                                  Student_Cubit.get(context).email_controller.text,
                                  Student_Cubit.get(context).pass_controller.text).then((value){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Student_Home()));
                              }).catchError((error){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:Text(
                                          'Login credentials is not correct',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.redAccent,
                                  ),
                                );

                              });

                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                ),
              ),
            );
          },
          listener:(context , Student_States state){},
      ),
    );
  }


}

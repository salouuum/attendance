
import 'package:attendence_sfe/doctor/doctor%20cubit/doctor_cubit.dart';
import 'package:attendence_sfe/doctor/doctor%20cubit/doctor_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Doctor_Home.dart';

class Doctor_Login extends StatelessWidget {
  const Doctor_Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> Doctor_Cubit(),
      child:BlocConsumer<Doctor_Cubit , Doctor_States>(
          builder: (context , Doctor_States state){
            return Scaffold(
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
                          controller: Doctor_Cubit.get(context).email_controller,
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
                          obscureText: true,
                          controller: Doctor_Cubit.get(context).pass_controller,
                        ),
                        SizedBox(height: 20.0,),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
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
                              Doctor_Cubit.get(context).doctor_auth(
                                  Doctor_Cubit.get(context).email_controller.text,
                                  Doctor_Cubit.get(context).pass_controller.text).then((value){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Doctor_Home()));
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
          listener: (context , Doctor_States state){}
      ) ,
    );
  }

}

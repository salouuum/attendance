import 'package:attendence_sfe/doctor/Doctor_login.dart';
import 'package:attendence_sfe/student/Student_Login.dart';
import 'package:attendence_sfe/student/Student_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'doctor/Doctor_Home.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async => false ,
      child: Scaffold(
        body: SafeArea(
            child:Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset('Assets/welcome.gif'),
                    ),
                    Center(
                      child: Text(
                          'Welcome',
                           style: TextStyle(
                               fontSize: 60,
                               fontWeight: FontWeight.bold,
                               color: Colors.white
                           ),
                      ),
                    ),
                    SizedBox(height: 16,),
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
                        color: Colors.blueAccent,
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Colors.grey.shade900, Colors.grey.shade700]),
                      ),
                      width: double.infinity,
                      height: 130,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child:Stack(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.school_outlined , color: Colors.white,size: 50,),
                                SizedBox(width: 10,),
                                Text(
                                      'student',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 40
                                      ),
                                  ),
                              ],
                            ),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     IconButton(
                            //         onPressed:(){
                            //           Navigator.push(context, MaterialPageRoute(builder: (context)=> Student_Login()));
                            //         } ,
                            //         icon: Icon(Icons.login_outlined , color: Colors.white,size: 50,)
                            //     ),
                            //     SizedBox(height: 30,),
                            //     Text(
                            //         'Login',
                            //         style: TextStyle(
                            //           fontWeight: FontWeight.bold,
                            //           fontSize: 25,
                            //           color: Colors.white
                            //         ),
                            //     )
                            //   ],
                            // )
                            Positioned(
                                child: Container(
                                  width: 250,
                                  child: FloatingActionButton.extended(
                                      onPressed: ()async{
                                        String? studentid =await getprefs('studentId');
                                        if(studentid != null){
                                           Navigator.push(context, MaterialPageRoute(builder: (context)=> Student_Home()));
                                        }else {
                                           Navigator.push(context, MaterialPageRoute(builder: (context)=> Student_Login()));
                                        }

                                      },
                                      label: Text(
                                          'Login as Student',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.grey.shade800
                                        ),
                                      ),
                                      icon: Icon(Icons.login_outlined,color: Colors.grey.shade800,),
                                      backgroundColor: Colors.white,
                                  ),
                                ),
                              bottom: 0,
                              right: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
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
                            colors: [Colors.grey.shade900, Colors.grey.shade700]),
                      ),
                      width: double.infinity,
                      height: 130,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child:Stack(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.book_outlined , color: Colors.white,size: 50,),
                                SizedBox(width: 10,),
                                Text(
                                  'Doctor',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 40
                                  ),
                                ),
                              ],
                            ),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     IconButton(
                            //         onPressed:(){
                            //           Navigator.push(context, MaterialPageRoute(builder: (context)=> Student_Login()));
                            //         } ,
                            //         icon: Icon(Icons.login_outlined , color: Colors.white,size: 50,)
                            //     ),
                            //     SizedBox(height: 30,),
                            //     Text(
                            //         'Login',
                            //         style: TextStyle(
                            //           fontWeight: FontWeight.bold,
                            //           fontSize: 25,
                            //           color: Colors.white
                            //         ),
                            //     )
                            //   ],
                            // )
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 250,
                                child: FloatingActionButton.extended(
                                  onPressed: ()async{
                                    String? doctorid =await getprefs('doctorId');
                                    if(doctorid != null){
                                      print(doctorid);
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Doctor_Home()));
                                    }else {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Doctor_Login()));
                                    }

                                  },
                                  label: Text(
                                    'Login as Doctor',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.grey.shade800
                                    ),
                                  ),
                                  icon: Icon(Icons.login_outlined,color: Colors.grey.shade800,),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
  Future<String?> getprefs(key)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? prefstring = prefs.getString(key);
    return prefstring ;
  }

}


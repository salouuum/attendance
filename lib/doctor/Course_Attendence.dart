import 'package:flutter/material.dart';

class Course_Attendence extends StatelessWidget {
  const Course_Attendence({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
              itemBuilder: (context, index)=>Builditem(),
              separatorBuilder: (context, index)=> SizedBox(height: 1.0,),
              itemCount: 2,
            ),
          )
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed:(){},
          label: Text('Add Lecture'),
          icon: Icon(Icons.add_circle_outline),
      ),
    );
  }
  Widget Builditem(){
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
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
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.blue, Colors.blueAccent]),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lecture 1',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 28 ,
                ),
                overflow: TextOverflow.clip,
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
                          '100' ,
                          style: TextStyle( color: Colors.white , fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.cancel_presentation_outlined , color: Colors.white,),
                        SizedBox(height: 15,),
                        Text(
                          'Absent' ,
                          style: TextStyle(fontWeight: FontWeight.w900 , color: Colors.white , fontSize: 18),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          '2' ,
                          style: TextStyle( color: Colors.white , fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      children: [
                        IconButton(
                            onPressed:(){

                            } ,
                            icon:Icon(Icons.arrow_circle_right_outlined,color: Colors.white,)
                        ),
                        Text(
                          'Show more' ,
                          style: TextStyle(fontWeight: FontWeight.w900 , color: Colors.white , fontSize: 18),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          ' ' ,
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
    );
  }
}

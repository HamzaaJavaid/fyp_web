import 'dart:html';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fyp_tracker/about_us.dart';
import 'package:fyp_tracker/feedback_page.dart';
import 'package:fyp_tracker/search_project.dart';



class main_dashboard extends StatefulWidget {
  const main_dashboard({Key? key}) : super(key: key);

  @override
  _main_dashboardState createState() => _main_dashboardState();
}

class _main_dashboardState extends State<main_dashboard> {
  Widget Expand_tiles(String title,String name,double height,double width,Color color){
    return Row(
      children: [

        Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(width: 8,),
        Container(
          width: width,
          height: height,

          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(20)),


          ),
          child: Padding(padding:EdgeInsets.all(13),child: Text(name,textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)),
        ),
      ],
    );

  }

  Widget full_tile_model(String supervisor_name,String start_date,String end_date,String members,String description){



    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 67,),
            Expand_tiles("SuperVisor",supervisor_name,47,140,Colors.greenAccent.withOpacity(0.5)),

          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            SizedBox(width: 7,),
            Expand_tiles("START DATE",start_date,57,110,Colors.orange.withOpacity(0.6)),
            SizedBox(width: 5,),
            Expand_tiles("END DATE",end_date,57,110,Colors.orange.withOpacity(0.6)),

          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            SizedBox(width: 7,),
            Expand_tiles("MEMBERS",members,57,310,Colors.amber.withOpacity(0.5)),


          ],
        ),

        SizedBox(height: 10,),
        Row(
          children: [
            SizedBox(width: 4,),
            Expand_tiles("DESCRIPTION",description,117,300,Colors.deepPurpleAccent.withOpacity(0.4)),


          ],
        ),
        SizedBox(height: 10,),

        SizedBox(height: 20,),

      ],
    );
  }

  final firestor = FirebaseFirestore.instance;
   int projects  =0;





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context)=>Scaffold(
            appBar: AppBar(backgroundColor: Colors.greenAccent,
              title:Text("FYP SYSTEM"),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(

                children: [


                  StreamBuilder(
                    stream: firestor.collection("Projects").snapshots(),
                    builder: (context , AsyncSnapshot<QuerySnapshot> snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Center(child: CircularProgressIndicator(),);
                      }
                      return snapshot.hasData?
                      ListView.builder(

                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context , index)  {

                            String title_name = snapshot.data!.docs[index]['Title'];
                            String supervisor_name  = snapshot.data!.docs[index]['Supervisor'];

                            String start_date = snapshot.data!.docs[index]['Start date'];
                            String end_date  = snapshot.data!.docs[index]['End date'];
                            projects = snapshot.data!.docs.length;


                            String members = snapshot.data!.docs[index]['Members'];
                            String description  = snapshot.data!.docs[index]['Description'];

                            print("HELLO");

                            print(title_name);
                            print(supervisor_name);
                            print(members);
                            print(start_date);
                            print(end_date);
                            print(description);
                            print(snapshot.data!.docs.length);




                            return Column(
                              children: [
                              SizedBox(height: 80,),
                            Row(


                            children: [
                            SizedBox(width: 30,),
                            Container(
                            height: 700,
                            width: 240,

                            decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Center(
                            child: Column(
                            children: [
                            SizedBox(height: 50,),
                            MaterialButton(onPressed: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context)=> main_dashboard()));
                            },
                            color: Colors.greenAccent,
                            height: 50,
                            minWidth: 180,
                            elevation: 12,
                            shape: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.transparent),
                            ),
                            child: Text('HOME',style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.white
                            ),),
                            ),
                            SizedBox(height: 50,),
                            MaterialButton(onPressed: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Search_project()));
                            },
                            color: Colors.purpleAccent,
                            height: 50,
                            minWidth: 180,
                            elevation: 12,
                            shape: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.transparent),
                            ),
                            child: Text('SEARCH ',style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.white
                            ),),
                            ),

                              SizedBox(height: 50,),
                              MaterialButton(onPressed: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context)=>feedback_form()));
                                  },
                                color: Colors.cyanAccent,
                                height: 50,
                                minWidth: 180,
                                elevation: 12,
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                child: Text('Feed-Back ',style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white
                                ),),
                              ),
                            SizedBox(height: 50,),
                            MaterialButton(onPressed: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context)=> About_us()));
                            },
                            color: Colors.blue,
                            height: 50,
                            minWidth: 180,
                            elevation: 12,
                            shape: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.transparent),
                            ),
                            child: Text('ABOUT US',style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.white
                            ),),
                            ),



                            ],
                            ),
                            ),

                            ),
                            SizedBox(width: 80,),
                            Container(
                            height: 700,
                            width: 820,

                            decoration: BoxDecoration(
                            color: Colors.yellowAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            SizedBox(height: 30,),
                            Row(
                            children: [
                            SizedBox(width: 50,),
                            Container(

                            width: 300,
                            height: 120,

                            decoration: BoxDecoration(
                            color: Colors.white,
                            // color: Colors.yellowAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Center(
                            child: Column(
                            children: [
                            Text('$projects',style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold

                            ),),
                            SizedBox(height: 10,),
                            Text('TOTAL PROJECTS',style: TextStyle(
                            fontSize: 20,
                            color: Colors.greenAccent
                            ),),
                            ],
                            ),
                            )
                            ),
                            SizedBox(width: 90,),
                            Container(

                            width: 300,
                            height: 120,

                            decoration: BoxDecoration(
                            color: Colors.white,
                            // color: Colors.yellowAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Center(
                            child: Column(
                            children: [
                            Text('${(projects*4)-2}+',style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold

                            ),),
                            SizedBox(height: 10,),
                            Text('STUDENTS ENROLLED',style: TextStyle(
                            fontSize: 20,
                            color: Colors.orangeAccent
                            ),),
                            ],
                            ),
                            )
                            ),
                            ],
                            ),

                            SizedBox(height: 30,),
                            Row(
                            children: [
                            SizedBox(width: 50,),
                            Container(

                            width: 500,
                            height: 480,

                            decoration: BoxDecoration(
                            color: Colors.white,
                            // color: Colors.yellowAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Center(
                            child: Column(
                            children: [
                            SizedBox(height: 30,),
                            CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.purpleAccent,
                            child: Icon(Icons.settings_system_daydream,color: Colors.white,size: 60,),
                            ),
                            SizedBox(height: 30,),
                            Text('ABOUT SYSTEM',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 30),),
                            SizedBox(height: 60,),
                          Padding(padding: EdgeInsets.all(20),child:   Text('FYP Tracker System is an Online Cloud Based Tracking System\n'
                              'Which Allow easy Progress Managment and also allow the Creation'
                              'of the Final Year Projects Records by Providing Tools to view , '
                              'Create and Delete and also it allows to update the current Records'
                              'It also allow Admin and Teachers to add their feedback against student'
                              'Evaluation Section in Android App give flexibiltiy to Teachers to add'
                              'their Comments on their students project Progress',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w100
                            ),
                          ),)

                            ],
                            ),
                            ),
                            ),
                            SizedBox(width: 30,),
                            Container(

                            width: 200,
                            height: 480,

                            decoration: BoxDecoration(
                            color: Colors.white,
                            // color: Colors.yellowAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Center(
                            child: Column(
                            children: [
                            SizedBox(height: 30,),
                            CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.lightGreenAccent,
                            child: Icon(Icons.supervised_user_circle_sharp,color: Colors.white,size: 60,),
                            ),
                            SizedBox(height: 30,),
                            Text('SuperVisors',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 30),),
                            SizedBox(height: 60,),
                            Text(
                            'SIR DILAWAR\n'
                            'SIR IFTIKHAR AHMAD\n'
                            'MAM AYSEHS ADEEL\n'
                            'SIR SADIQ UR REHMAN\n'
                            'SIR INAYAT ULLAH\n'
                            'SIR SOHAIL YOUSAFZAI\n'
                            'SIR IZAHAR ULLAH\n'
                            'SIR ADEEL ALI SHAH\n',
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent
                            ),
                            )


                            ],
                            ),
                            ),
                            )
                            ],
                            ),
                            ],
                            ),

                            ),




                            ],
                            ),
                              ],
                            );
                          }

                      )
                          : Container(
                        height: 200,
                        width: 200,
                        child: Text("Wrong"),
                      );


                    },

                  ),

                  SizedBox(height: 50,),



                ],
              ),
            )
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class About_us extends StatefulWidget {
  const About_us({Key? key}) : super(key: key);

  @override
  _About_usState createState() => _About_usState();
}

class _About_usState extends State<About_us> {
  Widget about_tile(String name , String designation, Color color){
    return Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 6,
                  blurRadius: 8,
                  offset: Offset(3,3)
              )
            ]

        ),
        width: 300,
        height: 70,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8,),
            Text('     $name',style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.white,
            ),),
            SizedBox(height: 12,),
            Text('       $designation ',textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: Colors.white60,
              ),)
          ],
        )

    );
  }
  @override


  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text('ABOUT US  ',style: TextStyle(color: Colors.black),),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    CircleAvatar(
                      radius: 80,
                      child: Image(
                        image: AssetImage('Images/logo.jpg'),
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          child: Image(
                            image: AssetImage('Images/logo.jpg'),
                          ),
                        ),
                        about_tile("HAMZA JAVAID", "FULL STACK DEVELOPER ( APP & WEB ) ", Colors.blueAccent),

                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        SizedBox(width: 20,),

                        about_tile("MAAZ IQBAL", "Front End DEVELOPER  ", Colors.deepOrangeAccent),
                        CircleAvatar(
                          radius: 40,
                          child: Image(
                            image: AssetImage('Images/logo.jpg'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          child: Image(
                            image: AssetImage('Images/logo.jpg'),
                          ),
                        ),
                        about_tile("AHSEN SALEEM", "ANALYST AND CONTENT WRITER ", Colors.deepPurpleAccent),

                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        SizedBox(width: 20,),

                        about_tile("Zahoor", "System Atchitect", Colors.greenAccent),
                        CircleAvatar(
                          radius: 40,
                          child: Image(
                            image: AssetImage('Images/logo.jpg'),
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}

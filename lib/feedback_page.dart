import 'package:flutter/material.dart';

class feedback_form extends StatefulWidget {
  const feedback_form({Key? key}) : super(key: key);

  @override
  _feedback_formState createState() => _feedback_formState();
}

class _feedback_formState extends State<feedback_form> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(
                width: 700,
                height: 500,

                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: Offset(3,7),
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.orangeAccent.withOpacity(0.6),
                        Colors.greenAccent.withOpacity(0.6),
                      ],

                    )
                ),
                child: Center(
                  child: Column(

                    children: [
                      Text("Give Us Your Feedback",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white
                      ),),
                      Padding(padding: EdgeInsets.all(30),
                        child: TextFormField(

                          onChanged: (value){
                            setState(() {

                            });
                          },
                          decoration: InputDecoration(
                              hintText: "Your Name",

                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30))
                              )
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(30),
                        child: TextFormField(

                          onChanged: (value){
                            setState(() {

                            });
                          },
                          decoration: InputDecoration(
                              hintText: "Your Email Adress",

                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30))
                              )
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(30),
                        child: TextFormField(

                          onChanged: (value){
                            setState(() {

                            });
                          },
                          decoration: InputDecoration(
                              hintText: "Your FeedBack",

                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30))
                              )
                          ),
                        ),
                      ),
                      MaterialButton(onPressed : (){


                        Navigator.pop(context);



                      },

                        color: Colors.blue,
                        height: 70,
                        minWidth: 280,
                        elevation: 12,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        child: Text('Submit FeedBack',style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.white
                        ),),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50,),
            ],
          ),
        )
      ),
    );
  }
}

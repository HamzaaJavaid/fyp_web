import 'package:flutter/material.dart';
import 'package:fyp_tracker/main_dashboard.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(

        apiKey: "AIzaSyACZ7vh_tTtiKl1nTZaxvyv66XCzR-REks",

        projectId: "fyp-tracking-system-48309",
        storageBucket: "fyp-tracking-system-48309.appspot.com",
        messagingSenderId: "530241977245",
        appId: "1:530241977245:web:f0877556283bbcc815cd74",
        measurementId: "G-WN5B0K5H8S"
    )

  );
  runApp(main_dashboard());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context)=>Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: Row(
                children: [
                  Expanded( //<-- Expanded widget
                      child: Image.asset(
                        'Images/1.png',
                        fit: BoxFit.cover,
                      )),
                  Expanded( //<-- Expanded widget
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 21),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Welcome back',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Login to your account',
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 35),
                          Padding(padding:EdgeInsets.all(8),child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Enter Name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(30))
                                )
                            ),
                          ),),

                          const SizedBox(height: 20),
                          Padding(padding:EdgeInsets.all(8),child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Your Registration Number",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(30))
                                )
                            ),
                          ),),
                          const SizedBox(height: 25),
                          Row(
                            //...
                          ),
                          const SizedBox(height: 30),
                          MaterialButton(onPressed: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context)=> main_dashboard()));
                          },
                            color: Colors.greenAccent,
                            height: 70,
                            minWidth: 280,
                            elevation: 12,
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            child: Text('LOGIN',style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Colors.white
                            ),),
                          ),
                          const SizedBox(height: 35),
                          MaterialButton(onPressed: (){

                          },
                              color: Colors.black,
                              height: 70,
                              minWidth: 280,
                              elevation: 12,
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 60,),
                                  Text('Login With ',style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white
                                  ),),
                                  SizedBox(width: 10,),
                                  Icon(Icons.g_mobiledata,color: Colors.orangeAccent,size: 60,)
                                ],
                              )
                          ),


                        ],
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),
      )
    );
  }
}

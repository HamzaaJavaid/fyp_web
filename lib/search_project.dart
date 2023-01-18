import 'package:flutter/material.dart';

import 'package:expandable/expandable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Search_project extends StatefulWidget {
  const Search_project({Key? key}) : super(key: key);

  @override
  _Search_projectState createState() => _Search_projectState();
}

class _Search_projectState extends State<Search_project> {


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

  final search_converse_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text('SEARCH PROJECT',style: TextStyle(
              color: Colors.blueAccent
          ),),
        ),
        body: SafeArea(
          child:  Column(
            children: [

              SizedBox(height: 20,),
              Row(children: [
                MaterialButton(onPressed: (){
                  setState(() {
                    Navigator.pop(context);

                  });
                },
                  child: CircleAvatar(radius: 30,
                    backgroundColor: Colors.greenAccent,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(padding:EdgeInsets.all(8),
                    child: TextFormField(
                    controller: search_converse_controller,
                    onChanged: (value){
                      setState(() {

                      });
                    },
                    decoration: InputDecoration(
                        hintText: "SEARCH Projects",

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        )
                    ),
                  ),),)
              ],),

              SizedBox(height: 10,),
              Divider(color: Colors.black,thickness: 0.3,endIndent: 30,indent: 30,),
              SizedBox(height: 20,),

              //PROJECTS TILES


              Expanded(child:  StreamBuilder(
                stream: firestor.collection("Projects").snapshots(),
                builder: (context , AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  return snapshot.hasData?
                  ListView.builder(

                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context , index){

                        String title_name = snapshot.data!.docs[index]['Title'];
                        String supervisor_name  = snapshot.data!.docs[index]['Supervisor'];

                        String start_date = snapshot.data!.docs[index]['Start date'];
                        String end_date  = snapshot.data!.docs[index]['End date'];


                        String members = snapshot.data!.docs[index]['Members'];
                        String description  = snapshot.data!.docs[index]['Description'];

                        String first_comment = snapshot.data!.docs[index]['1st Progress Report Comments'];
                        String second_comment  = snapshot.data!.docs[index]['2nd Progress Report Comments'];


                        String third_comment = snapshot.data!.docs[index]['3rd Progress Report Comments'];
                        String final_viva  = snapshot.data!.docs[index]['Final Viva'];


                        print("HELLO");

                        print(title_name);
                        print(supervisor_name);
                        print(members);
                        print(start_date);
                        print(end_date);
                        print(description);
                        print(snapshot.data!.docs.length);



                        if(search_converse_controller.text.isEmpty){
                          // scroll_Controller.jumpTo(scroll_Controller.position.maxScrollExtent);
                             return Column(
                            children: [
                              ExpandablePanel(
                                header:  Text("$title_name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black)),

                                collapsed: Text(" ", softWrap: true, maxLines: 1000, overflow: TextOverflow.ellipsis,),
                                expanded: full_tile_model("$supervisor_name","$start_date","$end_date","$members","$description"),
                              ),

                              Text('1st Progress Comments :- $first_comment',style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('2nd Progress Comments :- $second_comment',style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('3rd Progress Comments :- $third_comment',style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('Final Viva Remarks :- $final_viva',style: TextStyle(fontWeight: FontWeight.bold),),


                              SizedBox(height: 10,),
                              Divider(color: Colors.black,thickness: 0.3,endIndent: 30,indent: 30,),

                            ],
                          );

                        }
                        else if(title_name.toLowerCase().contains(search_converse_controller.text.toLowerCase())){
                          //scroll_Controller.jumpTo(scroll_Controller.position.maxScrollExtent);
                             return Column(
                            children: [
                              ExpandablePanel(
                                header:  Text("$title_name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black)),

                                collapsed: Text(" ", softWrap: true, maxLines: 1000, overflow: TextOverflow.ellipsis,),
                                expanded: full_tile_model("$supervisor_name","$start_date","$end_date","$members","$description"),
                              ),

                              Text('1st Progress Comments :- $first_comment',style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('2nd Progress Comments :- $second_comment',style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('3rd Progress Comments :- $third_comment',style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('Final Viva Remarks :- $final_viva',style: TextStyle(fontWeight: FontWeight.bold),),

                              SizedBox(height: 10,),
                              Divider(color: Colors.black,thickness: 0.3,endIndent: 30,indent: 30,),

                            ],
                          );

                        }
                        else{
                          //scroll_Controller.jumpTo(scroll_Controller.position.maxScrollExtent);
                          return Container();
                        }


                      }

                  )
                      : Container(
                    height: 200,
                    width: 200,
                    child: Text("Wrong"),
                  );


                },

              )),


              //SEARCH TILES........................................

              /*
                  ExpandablePanel(
                    header:  Text("System Remodeling Application",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.cyanAccent)),

                    collapsed: Text("This Project is about the ARTIFICIAL INTELLIGENCE .....", softWrap: true, maxLines: 1000, overflow: TextOverflow.ellipsis,),
                    expanded: full_tile_model("Sir Dilawar ","23/11/2022","23,11,2023","HAMZA , AHSEN,HAROON","PROJECT DESCRIPTION"),
                  ),
                  SizedBox(height: 10,),
                  Divider(color: Colors.black,thickness: 0.3,endIndent: 30,indent: 30,),
                  SizedBox(height: 10,),
                  ExpandablePanel(
                    header: Text("AI MODELING",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.cyanAccent)),
                    collapsed: Text("This Project is about the ARTIFICIAL INTELLIGENCE .....", softWrap: true, maxLines: 1000, overflow: TextOverflow.ellipsis,),
                    expanded: full_tile_model("Sir IFTIKHAR ","23/11/2022","23,11,2023","ALAN , MICHAEL,JASSON","PROJECT DESCRIPTION # 2"),
                  ),
                  Divider(color: Colors.black,thickness: 0.3,endIndent: 30,indent: 30,),
                  SizedBox(height: 10,),
                  ExpandablePanel(
                    header: Text("AI MODELING",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.cyanAccent)),
                    collapsed: Text("This Project is about the ARTIFICIAL INTELLIGENCE .....", softWrap: true, maxLines: 1000, overflow: TextOverflow.ellipsis,),
                    expanded: full_tile_model("Sir IFTIKHAR ","23/11/2022","23,11,2023","ALAN , MICHAEL,JASSON","PROJECT DESCRIPTION # 2"),
                  ),
                  Divider(color: Colors.black,thickness: 0.3,endIndent: 30,indent: 30,),
                  SizedBox(height: 10,),
                  ExpandablePanel(
                    header: Text("AI MODELING",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.cyanAccent)),
                    collapsed: Text("This Project is about the ARTIFICIAL INTELLIGENCE .....", softWrap: true, maxLines: 1000, overflow: TextOverflow.ellipsis,),
                    expanded: full_tile_model("Sir IFTIKHAR ","23/11/2022","23,11,2023","ALAN , MICHAEL,JASSON","PROJECT DESCRIPTION # 2"),
                  ),
                  Divider(color: Colors.black,thickness: 0.3,endIndent: 30,indent: 30,),
                  SizedBox(height: 10,),
                  ExpandablePanel(
                    header: Text("AI MODELING",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.cyanAccent)),
                    collapsed: Text("This Project is about the ARTIFICIAL INTELLIGENCE .....", softWrap: true, maxLines: 1000, overflow: TextOverflow.ellipsis,),
                    expanded: full_tile_model("Sir IFTIKHAR ","23/11/2022","23,11,2023","ALAN , MICHAEL,JASSON","PROJECT DESCRIPTION # 2"),
                  ),


                   */
              //SEARCH TILES ENDS......................................



            ],
          ),




        ),
      ),
    );
  }
}


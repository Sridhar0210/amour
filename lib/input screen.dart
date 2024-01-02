

import 'package:flutter/material.dart';

import 'class.dart';
import 'color.dart';
import 'dispaly.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _feedbackController = TextEditingController();
  final _formkey=GlobalKey<FormState>();
  void _submitFeedback() {
    if(_formkey.currentState!.validate());

    String feedback = _feedbackController.text;
    print('Feedback submitted: $feedback');

  }
  bool r1=false;
  bool r2=false;
  bool r3=false;
  bool r4=false;
  bool r5=false;
  bool r6=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Container(
            height: 1500,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [gtgreen,Colors.white],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [SizedBox(height: 50),
                CircleAvatar(backgroundImage: AssetImage("assets/img/ap.jpg"),radius: 70,),
                Text("Rate : Annapoorna",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25,shadows:[
                  Shadow(
                    color: Colors.black,      // Choose the color of the shadow
                    blurRadius: 2.0,          // Adjust the blur radius for the shadow effect
                    offset: Offset(2.0, 2.0), // Set the horizontal and vertical offset for the shadow
                  ),
                ],),),

                Text("How was Your Last Visit?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25,shadows:[
                  Shadow(
                    color: Colors.black,      // Choose the color of the shadow
                    blurRadius: 2.0,          // Adjust the blur radius for the shadow effect
                    offset: Offset(2.0, 2.0), // Set the horizontal and vertical offset for the shadow
                  ),
                ],),),
                Row(
                  children: [
                    SizedBox(width: 25,),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            r1 = !r1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.star,color:r1 ? Colors.orangeAccent:Colors.grey,size: 45),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            r2 = !r2;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.star,color:r2 ? Colors.orangeAccent:Colors.grey,size: 45),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            r3 = !r3;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.star,color:r3 ? Colors.orangeAccent:Colors.grey,size: 45),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            r4 = !r4;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:Icon(Icons.star,color:r4 ? Colors.orangeAccent:Colors.grey,size: 45),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            r5 = !r5;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.star,color:r5 ? Colors.orangeAccent:Colors.grey,size: 45),
                        )),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height:50,
                    width: 350,
                    child: TextFormField(

                      validator: (value){
                        if(value?.length == 0){
                          return 'Please enter the feedback';
                        }
                      },

                      controller: _feedbackController,
                      decoration: InputDecoration(
                        labelText: "comments",
                        labelStyle: TextStyle(
                          color: Colors.black),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0,),
                          borderSide: new BorderSide(color: Colors.black,),
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black87, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                    ),

                    ),
                  ),
                ),
                SizedBox(height: 50,),
                SwitchListTile(
                  title: Text('Show your Name',style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                  ),
                  value: r6,
                  activeColor: Colors.red,
                  inactiveTrackColor: Colors.grey,
                  onChanged: (bool value) {
                    setState(() {
                      r6 = value;
                    });
                  },
                ),


                SizedBox(height:20,),


                SizedBox(
                  height: 60,
                  width: 180,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Card(
                      elevation: 10,
                      child: ElevatedButton(
                        onPressed: () {
                          _submitFeedback;
                          String name = _feedbackController.text;

                          if (name.isNotEmpty ) {
                            DataModel newItem = DataModel(name: name,);
                            dataModelList.itemList.add(newItem);
                            _feedbackController.clear();

                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DisplayScreen()));
                          }
                        },style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87
                      ),
                        child: Text('Submit',style: TextStyle(
                            color: Colors.green,fontSize: 18,fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}



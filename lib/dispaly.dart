import 'package:amour/color.dart';
import 'package:flutter/material.dart';
import 'class.dart';
import 'input screen.dart';
class DisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [gtgreen,Colors.white],
            ),
          ),
          height: MediaQuery.of(context).size.height*1,
          child:Column(
            children: [

              Container(
                height: MediaQuery.of(context).size.height*.8,
                child: ListView.builder(
                  itemCount: dataModelList.itemList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 25,
                      shadowColor: Colors.black,
                      child: Container(

                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(dataModelList.itemList[index].name.toString()),

// ElevatedButton(onPressed: (){}, child: Text("Add more details"))

                            ],
                          ),
                        ),


                      ),
                    );





                  },

                ),
              ),
            ],
          )


      ),
      floatingActionButton: FloatingActionButton(
        focusColor: Colors.redAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: gtgreen,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>InputScreen()));
        },
        tooltip: "feedback",
        child: Icon(Icons.add,color: Colors.black,),
      ),

    );
  }
}

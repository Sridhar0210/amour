import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color.dart';
class must extends StatefulWidget {
  late String title;

  // const must({super.key});

  @override
  State<must> createState() => _mustState();
}

class _mustState extends State<must> {
  bool clk1=false;
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: Text('Must try..',style: TextStyle(
            fontSize: 30,color: Colors.black87,
            fontWeight: FontWeight.bold),),
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [gtgreen,Colors.white],
              ),

            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [gtgreen,Colors.white],
          ),
        ),
        height: MediaQuery.of(context).size.height*1,
        child: GridView.builder(
            itemCount: 6,

            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisExtent: 300,
              maxCrossAxisExtent: 300,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder:( BuildContext ctx, index){
              return Card(
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20) ),
                elevation: 10,
                shadowColor: gtgreen,
                color: bgclr,

                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20
                              ),
                              image: DecorationImage(
                                image:NetworkImage('https://images.slurrp.com/prodarticles/tc4lgfyuzni.webp?impolicy=slurrp-20210601&width=1200&height=900'),fit: BoxFit.fill,
                              )),),
                        Positioned(
                          top: 5,
                          right: 5,
                          child:
                           GestureDetector(
                               onTap: () {
                                 setState(() {
                                   clk1 = !clk1;
                                 });
                               },
                               child: Icon(Icons.favorite,color:clk1 ? Colors.red:Colors.white)),

                        ),
                        Positioned(child:  Text('Chicken biriyani',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),bottom: 25,left: 15,),
                        Positioned(child:  Text('₹100',style: TextStyle(color: Colors.white,fontSize: 15),),bottom: 5,right: 20,),

                      ],
                    ),


                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(' Anna poorna',style: GoogleFonts.openSans(fontSize: 16,fontWeight: FontWeight.bold  ),),
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 10,
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _)=>Icon(
                              Icons.star_purple500_outlined,
                              color: Colors.orangeAccent,
                            ),
                            onRatingUpdate: (rating){
                              print(rating);
                            },
                          ),

                        ],
                      ),
                      Text(' Race course..',style:  GoogleFonts.openSans(fontSize: 15,  ),),
                      Gap(5),
                      Text("The grains of rice must not stick together but remain separate. The pieces of meat must be succulent – clear and dry – not greasy – and the meat must easily separate from the rice",style:  GoogleFonts.openSans(fontSize: 8, )),


                    ],),



                  ],
                ),
              );
            }),
      ),







    );
  }
}

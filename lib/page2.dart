import 'package:amour/page3.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';


import 'Page1.dart';
import 'color.dart';


class HotelDescription extends StatefulWidget {
  const HotelDescription({super.key});

  @override
  State<HotelDescription> createState() => _HotelDescriptionState();
}

class _HotelDescriptionState extends State<HotelDescription> {
  var currentIndex = 0;
  final number = '9876543210';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                  child: Column(children: [

                    Stack(
                      children: [
                        CarouselSlider.builder(
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * .35,
                              aspectRatio: 16 / 9,
                              viewportFraction: 1,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration: const Duration(
                                  milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: false,
                              enlargeFactor: 0.1,
                              scrollDirection: Axis.horizontal,
                            ),
                            itemCount: Donut.length,
                            itemBuilder: (BuildContext context, int Index,
                                int pageViewIndex) {
                              return Container(
                                decoration:
                                const BoxDecoration(),
                                foregroundDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.black,
                                      Colors.transparent,
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    stops: [0, 10.0],
                                  ),
                                ),
                                child: Image(
                                  image: AssetImage(Donut[Index].image),
                                  fit: BoxFit.fill,
                                ),
                              );
                            }
                        ),

                        // Positioned(
                        //   left: MediaQuery.of(context).size.height*.37,
                        //   top: MediaQuery.of(context).size.height*.26,
                        //   child: const Text(
                        //     "Gallery >",
                        //     style: TextStyle(color: Colors.white, fontSize: 18),
                        //   ),
                        // ),

                        GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                  const Page1()),
                                );
                              });
                            },


                            child: const Icon(Icons.arrow_left, size: 40,
                              color: Colors.white,)),
                        Positioned(
                          left: MediaQuery
                              .of(context)
                              .size
                              .width * .32,
                          top: MediaQuery
                              .of(context)
                              .size
                              .height * .3,
                          child: const Text(
                            "Annapoorna",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Text("Menu from Google", style: dividertext,),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shadowColor: Colors.black45,
                        elevation: 10,
                        color: bgclr,
                        child: SizedBox(

                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.2,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,

                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: gt.length,
                              itemBuilder: (BuildContext con, index) {
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  m1(
                                                    Gts: gt[index],
                                                  )));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image(
                                        image: AssetImage(gt[index].image),
                                        fit: BoxFit.fill,),
                                    ));
                              }),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Text("payment Offer", style: dividertext,),
                        const Expanded(child: Divider()),

                      ],
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .18,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 1,
                      child:
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .16,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(
                              milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ), itemCount: dis.length,
                        itemBuilder: (BuildContext context, int index,
                            int realIndex) {
                          return
                            Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * .25,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 1,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: gtgreen,
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(0, 5)
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(

                                      image: AssetImage(dis[index].image),
                                      fit: BoxFit.fill
                                  )
                              ),

                            );
                        },


                      ),),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Text("Location and timing", style: dividertext,),
                        Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(height: 5,),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.location_on_outlined, size: 35,
                            color: Colors.black54,),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "163 VRG Complex NSR Road Saibaba Colony"
                                  "Coimbbatore", style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      child: Center(
                        child: Text("View On Map", style:
                        TextStyle(color: gtgreen,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(height: 10,),
                    const Row(children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.access_time_outlined, size: 35,
                          color: Colors.black54,),
                      ),
                      SizedBox(width: 25,),
                      Text("CLOSED, OPEN AT 11AM", style:
                      TextStyle(color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                    ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpansionTile(
                        title: Center(
                          child: Text("Weekly Timings", style:
                          TextStyle(color: gtgreen,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          ),
                        ),
                        children: [
                          Container(
                            width: 300,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                  children: [
                                    Text("Monday", style:
                                    TextStyle(fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),),
                                    Text("11AM - 9.30PM", style:
                                    TextStyle(
                                      fontSize: 14, color: Colors.black,),),
                                  ],
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                  children: [
                                    Text("Tuesday", style:
                                    TextStyle(fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),),
                                    Text("11AM - 9.30PM", style:
                                    TextStyle(
                                      fontSize: 14, color: Colors.black,),),
                                  ],
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                  children: [
                                    Text("Wednesday", style:
                                    TextStyle(fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),),
                                    Text("11AM - 9.30PM", style:
                                    TextStyle(
                                      fontSize: 14, color: Colors.black,),),
                                  ],
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                  children: [
                                    Text("Thursday", style:
                                    TextStyle(fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),),
                                    Text("11AM - 9.30PM", style:
                                    TextStyle(
                                      fontSize: 14, color: Colors.black,),),
                                  ],
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                  children: [
                                    Text("Friday", style:
                                    TextStyle(fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),),
                                    Text("11AM - 9.30PM", style:
                                    TextStyle(
                                      fontSize: 14, color: Colors.black,),),
                                  ],
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                  children: [
                                    Text("Saturday", style:
                                    TextStyle(fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),),
                                    Text("11AM - 9.30PM", style:
                                    TextStyle(
                                      fontSize: 14, color: Colors.black,),),
                                  ],
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                  children: [
                                    Text("Sunday", style:
                                    TextStyle(fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),),
                                    Text("11AM - 9.30PM", style:
                                    TextStyle(
                                      fontSize: 14, color: Colors.black,),),
                                  ],
                                ),


                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    Row(children: [
                      const Expanded(child: Divider()),
                      Text("Features", style: dividertext,),
                      const Expanded(child: Divider()),
                    ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(children: [
                        Icon(Icons.wifi, size: 30, color: Colors.black54,),
                        Text(" Free Wifi", style: TextStyle(color: Colors
                            .black54),),
                        SizedBox(width: 50,),
                        Icon(Icons.credit_card, color: Colors.black54),
                        Text(" Card Accepted", style: TextStyle(color: Colors
                            .black54),),

                      ],
                      ),
                    ),
                    Divider(),
                    SizedBox(height: 10,),
                    Container(
                        height: 425,
                        color: bgclr,
                        child: Column(
                            children: [
                              const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Similar restaurant", style:
                                    TextStyle(fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                              Container(
                                  height: 290,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),

                                  ),
                                  child:
                                  ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: Similar.length,
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      return Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                20)),
                                        child: SizedBox(
                                          height: 290,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * .8,

                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Stack(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .only(top: 8.0),
                                                      child: Container(
                                                        height: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .height * .20,
                                                        width: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width * .8,
                                                        foregroundDecoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(20),
                                                          gradient: const LinearGradient(
                                                              begin: Alignment
                                                                  .bottomCenter,
                                                              end: Alignment
                                                                  .topCenter,
                                                              colors: [
                                                                Colors.black,
                                                                Colors.black12,
                                                              ]
                                                          ),
                                                        ),
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    Similar[index]
                                                                        .image),
                                                                fit: BoxFit.fill
                                                            ),
                                                            borderRadius: BorderRadius
                                                                .only(
                                                              bottomLeft: Radius
                                                                  .circular(25),
                                                              bottomRight: Radius
                                                                  .circular(25),
                                                              topRight: Radius
                                                                  .circular(20),
                                                              topLeft: Radius
                                                                  .circular(
                                                                  20),)
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: MediaQuery
                                                          .of(context)
                                                          .size
                                                          .height * .020,
                                                      bottom: MediaQuery
                                                          .of(context)
                                                          .size
                                                          .height * .035,
                                                      child: Text(Similar[index]
                                                          .hotelName,
                                                        style: GoogleFonts
                                                            .openSans(
                                                            color: Colors.white,
                                                            fontSize: 28,
                                                            fontWeight: FontWeight
                                                                .bold
                                                        ),),
                                                    ),
                                                    Positioned(
                                                      left: MediaQuery
                                                          .of(context)
                                                          .size
                                                          .height * .04,
                                                      bottom: MediaQuery
                                                          .of(context)
                                                          .size
                                                          .height * .02,
                                                      child: Text(
                                                        Similar[index].cusine,
                                                        style: GoogleFonts
                                                            .openSans(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                        ),),
                                                    ),
                                                  ]
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Row(children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .only(top: 2.0),
                                                      child: Icon(Icons
                                                          .location_on_outlined,
                                                        color: gtgreen,),
                                                    ),
                                                    Text(Similar[index].place,
                                                      style: GoogleFonts
                                                          .openSans(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight
                                                              .bold
                                                      ),),
                                                  ],),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .only(right: 10.0),
                                                    child: Row(
                                                      children: [

                                                        Padding(
                                                          padding: EdgeInsets
                                                              .only(right: 8.0),
                                                          child: Container(
                                                            height: MediaQuery
                                                                .of(context)
                                                                .size
                                                                .height * .02,
                                                            width: MediaQuery
                                                                .of(context)
                                                                .size
                                                                .width * .04,
                                                            color: Colors.green,
                                                            child: RatingBar
                                                                .builder(
                                                              glowRadius: 3,
                                                              initialRating: 3,
                                                              minRating: 1,
                                                              direction: Axis
                                                                  .horizontal,
                                                              allowHalfRating: true,
                                                              itemCount: 1,
                                                              itemSize: 15,
                                                              itemPadding: const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal: 0),
                                                              itemBuilder: (
                                                                  context, _) =>
                                                              const Icon(
                                                                Icons.star_rate,
                                                                size: 1,
                                                                color: Colors
                                                                    .amber,
                                                              ),
                                                              onRatingUpdate: (
                                                                  rating) {},
                                                            ),),
                                                        ),
                                                        Text(
                                                          Similar[index].rating,
                                                          style: GoogleFonts
                                                              .openSans(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight
                                                                  .bold
                                                          ),)
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text(Similar[index].distance,
                                                    style: GoogleFonts.openSans(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight
                                                            .bold
                                                    ),),

                                                ],),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .all(8.0),
                                                        child: Text("Parking",
                                                          style: GoogleFonts
                                                              .openSans(
                                                              fontSize: 16,
                                                              color: Colors
                                                                  .black,
                                                              fontWeight: FontWeight
                                                                  .bold),),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .all(8.0),
                                                        child: Container(
                                                            height: 25,
                                                            width: 45,
                                                            decoration: BoxDecoration(
                                                                border: Border
                                                                    .all(),
                                                                color: Colors
                                                                    .white,
                                                                borderRadius: BorderRadius
                                                                    .circular(
                                                                    5),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .black87,
                                                                    spreadRadius: 0.5,
                                                                    blurRadius: 25,
                                                                    offset: Offset(
                                                                        0, 5),
                                                                  )
                                                                ]
                                                            ),
                                                            child: Center(
                                                                child: Icon(
                                                                  Icons
                                                                      .directions_car,
                                                                  color: Colors
                                                                      .red,))),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .all(8.0),
                                                        child: Container(
                                                            height: 25,
                                                            width: 45,
                                                            decoration: BoxDecoration(
                                                                border: Border
                                                                    .all(),
                                                                color: Colors
                                                                    .white,
                                                                borderRadius: BorderRadius
                                                                    .circular(
                                                                    5),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .black87,
                                                                    spreadRadius: 0.5,
                                                                    blurRadius: 25,
                                                                    offset: Offset(
                                                                        0, 5),
                                                                  )
                                                                ]
                                                            ),
                                                            child: Center(
                                                                child: Icon(
                                                                  Icons
                                                                      .two_wheeler,
                                                                  color: Colors
                                                                      .green,))),
                                                      ),
                                                    ],
                                                  ),
                                                  const Icon(Icons.directions,
                                                    color: Colors.green,
                                                    size: 35,)

                                                ],)
                                            ],),
                                        ),
                                      );
                                    },

                                  )),
                            ]
                        )


                    ),
                  ])
              ),
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.black38,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .4,
                      decoration: BoxDecoration(
                          color: gtgreen,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () async {
                              final Uri url = Uri(
                                scheme: 'tel',
                                path: '9876543210',
                              );
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                print('cannot launch the url');
                              }
                            }
                            , child: const Icon(Icons.call)),
                      ),

                    ),

                    Container(
                        height: 35,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .4,
                        decoration: BoxDecoration(
                            color: gtgreen,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: ElevatedButton(onPressed: () async {
                          const weburl = 'amourgroups.page.link/home';
                          Share.share(weburl);
                        }, child: const Icon(Icons.share))

                    ),
                  ],
                ),
              )
            ]
        ),
      ),

    );
  }
  void initDynamicLink() {
    FirebaseDynamicLinks.instance.onLink.listen((event) {

    });

  }




  }

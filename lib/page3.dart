import 'package:flutter/material.dart';

import 'color.dart';


class m1 extends StatelessWidget {
  final gts Gts;


  const m1({super.key,required this.Gts});




  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:
        SafeArea(
          child: Container(
            height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage((Gts.image).toString()),fit: BoxFit.fill
                )
              ),


          ),
        )
    );
  }
}

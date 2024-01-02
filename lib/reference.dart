
import 'package:flutter/material.dart';

class forref extends StatefulWidget {
  const forref({super.key});

  @override
  State<forref> createState() => _forrefState();
}

class _forrefState extends State<forref> {
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(children: [ Row(
          children: [
            Container(
              height: 50,
              width: 150,
              color: Colors.red,
              child: Row(
                children: <Widget>[

                  _itemCount!=0? new  IconButton(icon: new Icon(Icons.remove,color: Colors.white,),onPressed: ()=>setState(()=>_itemCount--),):new Container(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Add',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
                  new Text(_itemCount.toString()),
                  new IconButton(icon: new Icon(Icons.add,color: Colors.white,),onPressed: ()=>setState(()=>_itemCount++)),


                ],
              ),
            ),
          ],
        )],)




    );
  }
}
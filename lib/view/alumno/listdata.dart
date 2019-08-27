
import 'package:flutter/material.dart';
import 'detail.dart';

class Listdata extends StatelessWidget {
  final List list;
  Listdata({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(6.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=> new Detail(list:list , index: i,)
              )
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['nombres'] + " " + list[i]['apellidos']),
                leading: new Icon(Icons.person),
                subtitle: new Text("${list[i]['fecha_nac']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
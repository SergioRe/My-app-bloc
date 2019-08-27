
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config/appConfig.dart';
import 'alumno/listdata.dart';
import 'alumno/adddata.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  String url = urlWs + "case=list_alu";
  var list;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    refreshList();
  }

  Future<List> refreshList() async {
    var response = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var extractdata = json.decode(response.body);
    setState(() {
      list = extractdata["data"];
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Lista de alumnos"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: ()=>Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (BuildContext context)=> new AddData(),
          )
        ),
      ),
      body: RefreshIndicator(
        key: refreshKey,
        child: new Listdata(list: list,),
        onRefresh: refreshList,
      ),
    );
  }
}

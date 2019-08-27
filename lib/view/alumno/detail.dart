import 'package:flutter/material.dart';
import '../../view/alumno/editdata.dart';
import 'package:http/http.dart' as http;
import '../home.dart';
import '../../config/appConfig.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index,this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {

void deleteData(){
  String url = urlWs + "case=delete_alu";
  http.post(url, body: {
    'id_alumno': widget.list[widget.index]['id_alumno']
  });
}

void confirm (){
  AlertDialog alertDialog = new AlertDialog(
    content: new Text("¿Estás seguro de que deseas eliminar a '${widget.list[widget.index]['nombres']}'?"),
    actions: <Widget>[
      new RaisedButton(
        child: new Text("Ok Eliminar!",style: new TextStyle(color: Colors.black),),
        color: Colors.red,
        onPressed: (){
          deleteData();
          Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context)=> new Home(),
            )
          );
        },
      ),
      new RaisedButton(
        child: new Text("Cancelar",style: new TextStyle(color: Colors.black)),
        color: Colors.green,
        onPressed: ()=> Navigator.pop(context),
      ),
    ],
  );

  showDialog(context: context, child: alertDialog);
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Datos del alumno:")),
      body: new Container(
        height: 300.0,
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text("Nombres: ${widget.list[widget.index]['nombres']}", style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                new Text("Apellidos : ${widget.list[widget.index]['apellidos']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Monto : ${widget.list[widget.index]['monto']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Estado : ${widget.list[widget.index]['estado']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Correo : ${widget.list[widget.index]['email']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Contraseña : ${widget.list[widget.index]['password']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("Editar"),
                      color: Colors.green,
                      onPressed: ()=>Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>new EditData(list: widget.list, index: widget.index,),
                        )
                      ),
                    ),
                    new RaisedButton(
                      child: new Text("Eliminar"),
                      color: Colors.red,
                      onPressed: ()=>confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
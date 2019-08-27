import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../home.dart';
import '../../config/appConfig.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController controllerCode;
  TextEditingController controllerNombres;
  TextEditingController controllerApellidos;
  TextEditingController controllerEmail;
  TextEditingController controllerPassword;
  TextEditingController controllerEstado;
  TextEditingController controllerMonto;
  TextEditingController controllerFechanac;

  Future editData() async {
    var idAlu = widget.list[widget.index]['id_alumno'];
    String url = urlWs + "case=update_alu" + "&id_alumno=$idAlu";
    String json = '{"nombres": "' + controllerNombres.text +
                    '", "apellidos": "' + controllerApellidos.text +
                    '", "fecha_nac": "' + controllerFechanac.text +
                    '", "estado": "' + controllerEstado.text +
                    '", "monto": "' + controllerMonto.text +
                    '", "email": "' + controllerEmail.text +
                    '", "password": "' + controllerPassword.text +
                    '"}';
    final response = await http.put(url, headers: { "Accept" : "application/json"}, body: json);
    var extractdata = jsonDecode(response.body);
    print(extractdata["success"]);
  }

  @override
    void initState() {
      controllerCode= new TextEditingController(text: widget.list[widget.index]['id_alumno'] );
      controllerNombres= new TextEditingController(text: widget.list[widget.index]['nombres'] );
      controllerApellidos= new TextEditingController(text: widget.list[widget.index]['apellidos'] );
      controllerFechanac= new TextEditingController(text: widget.list[widget.index]['fecha_nac'] );
      controllerEstado= new TextEditingController(text: widget.list[widget.index]['estado'] );
      controllerMonto= new TextEditingController(text: widget.list[widget.index]['monto'] );
      controllerEmail= new TextEditingController(text: widget.list[widget.index]['email'] );
      controllerPassword= new TextEditingController(text: widget.list[widget.index]['password'] );
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Editar alumno"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerCode,
                  decoration: new InputDecoration(
                      hintText: "Código", labelText: "Ingrese Código"),
                ),
                new TextField(
                  controller: controllerNombres,
                  decoration: new InputDecoration(
                      hintText: "Nombres", labelText: "Nombre"),
                ),
                new TextField(
                  controller: controllerApellidos,
                  decoration: new InputDecoration(
                      hintText: "Apellidos", labelText: "Apellidos"),
                ),
                new TextField(
                  controller: controllerEstado,
                  decoration: new InputDecoration(
                      hintText: "Estado", labelText: "Estado"),
                ),
                new TextField(
                  controller: controllerFechanac,
                  decoration: new InputDecoration(
                      hintText: "Fecha nacimiento:", labelText: "Fecha nacimiento"),
                ),
                new TextField(
                  controller: controllerMonto,
                  decoration: new InputDecoration(
                      hintText: "Monto", labelText: "Monto"),
                ),
                new TextField(
                  controller: controllerEmail,
                  decoration: new InputDecoration(
                      hintText: "Email", labelText: "Email"),
                ),
                new TextField(
                  controller: controllerPassword,
                  decoration: new InputDecoration(
                      hintText: "Password", labelText: "Password"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Editar alumno"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context)=>new Home()
                      )
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
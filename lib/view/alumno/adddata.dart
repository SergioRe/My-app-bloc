import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../config/appConfig.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/alumno_bloc.dart';
import '../home.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: new Text("Agregar alumno"),
        ),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.navigate_before),
          onPressed: ()=>Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context)=> new Home(),
            )
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocProvider(
            builder: (context) => FormAlumnoBloc(),
            child: MyForm(),
          ),
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  State<MyForm> createState() => _AlumnoModelState();
}

class _AlumnoModelState extends State<MyForm> {
  FormAlumnoBloc _formAlumnoBloc;
  final TextEditingController _nombresController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _montoController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();
  final TextEditingController _fechanacController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future addData() async {
    String url = urlWs + "case=insert_alu";
    String json = '{"nombres": "' + _nombresController.text +
                    '", "apellidos": "' + _apellidosController.text +
                    '", "fecha_nac": "' + _fechanacController.text +
                    '", "estado": "' + _estadoController.text +
                    '", "monto": "' + _montoController.text +
                    '", "email": "' + _emailController.text +
                    '", "password": "' + _passwordController.text +
                    '"}';
    final response = await http.post(url, headers: { "Accept" : "application/json"}, body: json);
    var extractdata = jsonDecode(response.body);
    print(extractdata["success"]);
  }

  @override
  void initState() {
    super.initState();
    _formAlumnoBloc = BlocProvider.of<FormAlumnoBloc>(context);
    _nombresController.addListener(_onNombresChanged);
    _apellidosController.addListener(_onApellidosChanged);
    _montoController.addListener(_onMontoChanged);
    _estadoController.addListener(_onEstadoChanged);
    _fechanacController.addListener(_onFechanacChanged);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormAlumnoBloc, AlumnoModel>(
      builder: (context, state) {
        if (state.formSubmittedSuccessfully) {
          return SuccessDialog(onDismissed: () {
            _nombresController.clear();
            _apellidosController.clear();
            _montoController.clear();
            _estadoController.clear();
            _fechanacController.clear();
            _emailController.clear();
            _passwordController.clear();
            _formAlumnoBloc.dispatch(FormReset());
          });
        }
        return Form(
          child: ListView(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new TextFormField(
                    controller: _nombresController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Nombres',
                    ),
                    autovalidate: true,
                    validator: (_) {
                      return state.isNombresValid ? null : 'Ingrese sus nombres';
                    },
                  ),
                  new TextFormField(
                    controller: _apellidosController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Apellidos',
                    ),
                    autovalidate: true,
                    validator: (_) {
                      return state.isApellidosValid ? null : 'Ingrese sus apellidos';
                    },
                  ),
                  new TextFormField(
                    controller: _montoController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.attach_money),
                      labelText: 'Monto',
                    ),
                    autovalidate: true,
                    validator: (_) {
                      return state.isMontoValid ? null : 'Ingrese el monto';
                    },
                  ),
                  new TextFormField(
                    controller: _estadoController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.settings),
                      labelText: 'Estado',
                    ),
                    autovalidate: true,
                    validator: (_) {
                      return state.isEstadoValid ? null : 'Ingrese el estado';
                    },
                  ),
                  new TextFormField(
                    controller: _fechanacController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      labelText: 'Fecha de nacimiento',
                    ),
                    autovalidate: true,
                    validator: (_) {
                      return state.isFechanacValid ? null : 'Ingrese la fecha de nacimiento';
                    },
                  ),
                  new TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Email',
                    ),
                    autovalidate: true,
                    validator: (_) {
                      return state.isEmailValid ? null : 'Ingrese su correo';
                    },
                  ),
                  new TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    autovalidate: true,
                    validator: (_) {
                      return state.isPasswordValid ? null : 'Ingrese su contraseña';
                    },
                  ),
                  new RaisedButton(
                    onPressed: state.isFormValid ? _onSubmitPressed : null,
                    child: Text('Agregar alumno'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _nombresController.dispose();
    _apellidosController.dispose();
    _montoController.dispose();
    _estadoController.dispose();
    _fechanacController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onNombresChanged() {
    _formAlumnoBloc.dispatch(NombresChanged(nombres: _nombresController.text));
  }

  void _onApellidosChanged() {
    _formAlumnoBloc.dispatch(ApellidosChanged(apellidos: _apellidosController.text));
  }

  void _onMontoChanged() {
    _formAlumnoBloc.dispatch(MontoChanged(monto: _montoController.text));
  }

  void _onEstadoChanged() {
    _formAlumnoBloc.dispatch(EstadoChanged(estado: _estadoController.text));
  }

  void _onFechanacChanged() {
    _formAlumnoBloc.dispatch(Fechanachanged(fechanac: _fechanacController.text));
  }

  void _onEmailChanged() {
    _formAlumnoBloc.dispatch(EmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    _formAlumnoBloc.dispatch(PasswordChanged(password: _passwordController.text));
  }

  void _onSubmitPressed() {
    addData();
    _formAlumnoBloc.dispatch(FormSubmitted());
  }
}

class SuccessDialog extends StatelessWidget {
  final VoidCallback onDismissed;

  SuccessDialog({Key key, @required this.onDismissed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(Icons.info),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Registro guardado correctamente!',
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
          RaisedButton(
            child: Text('OK'),
            onPressed: ()=>Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=> new Home(),
              )
            ),
            //onPressed: onDismissed,
          ),
        ],
      ),
    );
  }
}
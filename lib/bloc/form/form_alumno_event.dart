import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FormAlumnoEvent extends Equatable {
  FormAlumnoEvent([List props = const []]) : super(props);
}

class NombresChanged extends FormAlumnoEvent {
  final String nombres;

  NombresChanged({@required this.nombres}) : super([nombres]);

  @override
  String toString() => 'NombresChanged { nombres: $nombres }';
}

class ApellidosChanged extends FormAlumnoEvent {
  final String apellidos;

  ApellidosChanged({@required this.apellidos}) : super([apellidos]);

  @override
  String toString() => 'ApellidosChanged { apellidos: $apellidos }';
}

class MontoChanged extends FormAlumnoEvent {
  final String monto;

  MontoChanged({@required this.monto}) : super([monto]);

  @override
  String toString() => 'MontoChanged { monto: $monto }';
}

class EstadoChanged extends FormAlumnoEvent {
  final String estado;

  EstadoChanged({@required this.estado}) : super([estado]);

  @override
  String toString() => 'EstadoChanged { estado: $estado }';
}

class Fechanachanged extends FormAlumnoEvent {
  final String fechanac;

  Fechanachanged({@required this.fechanac}) : super([fechanac]);

  @override
  String toString() => 'Fechanachanged { fechanac: $fechanac }';
}

class EmailChanged extends FormAlumnoEvent {
  final String email;

  EmailChanged({@required this.email}) : super([email]);

  @override
  String toString() => 'EmailChanged { email: $email }';
}

class PasswordChanged extends FormAlumnoEvent {
  final String password;

  PasswordChanged({@required this.password}) : super([password]);

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class FormSubmitted extends FormAlumnoEvent {
  @override
  String toString() => 'FormSubmitted';
}

class FormReset extends FormAlumnoEvent {
  @override
  String toString() => 'FormReset';
}

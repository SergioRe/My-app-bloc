import 'dart:async';
import 'package:bloc/bloc.dart';
import '../alumno_bloc.dart';

class FormAlumnoBloc extends Bloc<FormAlumnoEvent, AlumnoModel> {
  final RegExp _nombresRegExp = RegExp(
    r'(\w+)',
  );

  final RegExp _apellidosRegExp = RegExp(
    r'(\w+)',
  );

  final RegExp _montoRegExp = RegExp(
    r'(\w+)',
  );

  final RegExp _estadoRegExp = RegExp(
    r'(\w+)',
  );

  final RegExp _fechanacRegExp = RegExp(
    r'(\w+)',
  );

  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  @override
  AlumnoModel get initialState => AlumnoModel.initial();

  @override
  void onTransition(Transition<FormAlumnoEvent, AlumnoModel> transition) {
    print(transition);
  }

  @override
  Stream<AlumnoModel> mapEventToState(
    FormAlumnoEvent event,
  ) async* {
    if (event is NombresChanged) {
      yield currentState.copyWith(
        nombres: event.nombres,
        isNombresValid: _isNombresValid(event.nombres),
      );
    }
    if (event is ApellidosChanged) {
      yield currentState.copyWith(
        apellidos: event.apellidos,
        isApellidosValid: _isApellidosValid(event.apellidos),
      );
    }
    if (event is MontoChanged) {
      yield currentState.copyWith(
        monto: event.monto,
        isMontoValid: _isMontoValid(event.monto),
      );
    }
    if (event is EstadoChanged) {
      yield currentState.copyWith(
        estado: event.estado,
        isEstadoValid: _isEstadoValid(event.estado),
      );
    }
    if (event is Fechanachanged) {
      yield currentState.copyWith(
        fechanac: event.fechanac,
        isFechanacValid: _isFechanacValid(event.fechanac),
      );
    }
    if (event is EmailChanged) {
      yield currentState.copyWith(
        email: event.email,
        isEmailValid: _isEmailValid(event.email),
      );
    }
    if (event is PasswordChanged) {
      yield currentState.copyWith(
        password: event.password,
        isPasswordValid: _isPasswordValid(event.password),
      );
    }
    if (event is FormSubmitted) {
      yield currentState.copyWith(formSubmittedSuccessfully: true);
    }
    if (event is FormReset) {
      yield AlumnoModel.initial();
    }
  }

  bool _isNombresValid(String nombres) {
    return _nombresRegExp.hasMatch(nombres);
  }

  bool _isApellidosValid(String apellidos) {
    return _apellidosRegExp.hasMatch(apellidos);
  }

  bool _isMontoValid(String monto) {
    return _montoRegExp.hasMatch(monto);
  }

  bool _isEstadoValid(String estado) {
    return _estadoRegExp.hasMatch(estado);
  }

  bool _isFechanacValid(String fechanac) {
    return _fechanacRegExp.hasMatch(fechanac);
  }

  bool _isEmailValid(String email) {
    return _emailRegExp.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}
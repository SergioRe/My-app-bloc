import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class AlumnoModel extends Equatable {
  final String nombres;
  final bool isNombresValid;
  final String apellidos;
  final bool isApellidosValid;
  final String monto;
  final bool isMontoValid;
  final String estado;
  final bool isEstadoValid;
  final String fechanac;
  final bool isFechanacValid;
  final String email;
  final bool isEmailValid;
  final String password;
  final bool isPasswordValid;
  final bool formSubmittedSuccessfully;

  bool get isFormValid => isEmailValid && isPasswordValid && isNombresValid && isApellidosValid && isMontoValid && isEstadoValid && isFechanacValid;

  AlumnoModel({
    @required this.nombres,
    @required this.isNombresValid,
    @required this.apellidos,
    @required this.isApellidosValid,
    @required this.monto,
    @required this.isMontoValid,
    @required this.estado,
    @required this.isEstadoValid,
    @required this.fechanac,
    @required this.isFechanacValid,
    @required this.email,
    @required this.isEmailValid,
    @required this.password,
    @required this.isPasswordValid,
    @required this.formSubmittedSuccessfully,
  }) : super([
          nombres,
          isNombresValid,
          apellidos,
          isApellidosValid,
          monto,
          isMontoValid,
          estado,
          isEstadoValid,
          fechanac,
          isFechanacValid,
          email,
          isEmailValid,
          password,
          isPasswordValid,
          formSubmittedSuccessfully,
        ]);

  factory AlumnoModel.initial() {
    return AlumnoModel(
      nombres: '',
      isNombresValid: false,
      apellidos: '',
      isApellidosValid: false,
      monto: '',
      isMontoValid: false,
      estado: '',
      isEstadoValid: false,
      fechanac: '',
      isFechanacValid: false,
      email: '',
      isEmailValid: false,
      password: '',
      isPasswordValid: false,
      formSubmittedSuccessfully: false,
    );
  }

  AlumnoModel copyWith({
    String nombres,
    bool isNombresValid,
    String apellidos,
    bool isApellidosValid,
    String monto,
    bool isMontoValid,
    String estado,
    bool isEstadoValid,
    String fechanac,
    bool isFechanacValid,
    String email,
    bool isEmailValid,
    String password,
    bool isPasswordValid,
    bool formSubmittedSuccessfully,
  }) {
    return AlumnoModel(
      nombres: nombres ?? this.nombres,
      isNombresValid: isNombresValid ?? this.isNombresValid,
      apellidos: apellidos ?? this.apellidos,
      isApellidosValid: isApellidosValid ?? this.isApellidosValid,
      monto: monto ?? this.monto,
      isMontoValid: isMontoValid ?? this.isMontoValid,
      estado: estado ?? this.estado,
      isEstadoValid: isEstadoValid ?? this.isEstadoValid,
      fechanac: fechanac ?? this.fechanac,
      isFechanacValid: isFechanacValid ?? this.isFechanacValid,
      email: email ?? this.email,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      password: password ?? this.password,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      formSubmittedSuccessfully:
          formSubmittedSuccessfully ?? this.formSubmittedSuccessfully,
    );
  }

  @override
  String toString() {
    return '''AlumnoModel {
      nombres: $nombres,
      isNombresValid: $isNombresValid,
      apellidos: $apellidos,
      isApellidosValid: $isApellidosValid,
      monto: $monto,
      isMontoValid: $isMontoValid,
      estado: $estado,
      isEstadoValid: $isEstadoValid,
      fechanac: $fechanac,
      isFechanacValid: $isFechanacValid,
      email: $email,
      isEmailValid: $isEmailValid,
      password: $password,
      isPasswordValid: $isPasswordValid,
      formSubmittedSuccessfully: $formSubmittedSuccessfully
    }''';
  }
}
import 'package:intl/intl.dart';

class Utils {

  String fechaActual() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);
    return formatted;
  }
}
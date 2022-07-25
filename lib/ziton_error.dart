library ziton_error;

import 'package:flutter/foundation.dart';
import 'package:ziton_error/src/send_error.dart';

class ZitonError {
  ZitonError(String dsn, FlutterErrorDetails errorDetails) {
    sendError(dsn, errorDetails);
  }
}

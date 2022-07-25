library ziton_error;

import 'package:flutter/foundation.dart';
import 'package:ziton_error/src/report/error_report.dart';
import 'package:ziton_error/src/send_error.dart';

class ZitonError {
  ZitonError(String dsn, FlutterErrorDetails errorDetails) {
    sendError(dsn, errorDetails);
  }
}

class ReportError{
  ReportError(String dsn,String msg,String fileName,String description)
  {
    errorReport(dsn, msg, fileName, description);
  }
}
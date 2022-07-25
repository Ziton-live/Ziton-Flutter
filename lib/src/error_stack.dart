import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// to retrieve current stacktrace
String errorStack(FlutterErrorDetails errorDetails) {
  ///if stacktrace from both  error object and current in null
  String stackNow = "stacktrace cannot be retrieved";

  /// checking whether stacktrace from errorObject is null
  /// happens during overflow errors
  stackNow = errorDetails.stack == null

      ///current stacktrace
      ? StackTrace.current.toString()

      ///stack trace specific to the errorObject
      : errorDetails.stack.toString();
  return stackNow;
}



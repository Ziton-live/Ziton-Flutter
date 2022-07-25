import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:ziton_error/src/context_info.dart';
import 'package:ziton_error/src/error_stack.dart';
import 'package:ziton_error/src/exception.dart';
import 'package:ziton_error/src/platform_info.dart';
import 'package:ziton_error/src/uri_details.dart';
import 'package:http/http.dart' as http;

import 'error_file.dart';

/// collects error information from the
sendError(String dsn, FlutterErrorDetails errorDetails) async {
  try {
    http.Response response = await http.post(Uri.parse(urRoute()), body: {
      "stack_trace": errorStack(errorDetails),
      "name": exceptionName(errorDetails),
      "error_file_name": errorFile(errorDetails),
      "line_number": errorLine(errorDetails).toString(),
      "file": fileName(errorDetails),
      "starting_line_number": startLine(errorDetails).toString(),
      "ending_line_number": endLine(errorDetails).toString(),
      "information": errorInfo(errorDetails),
      "environment": runningMode(),
      "context": runningContext(errorDetails),
      "library": runningLibrary(errorDetails),
      "platform": json.encode(platformInfo()),
      "screen": json.encode(screenDetails()),
      "project": dsn
    });

    if (response.statusCode == 201) {
      if (kDebugMode) {
        print("head on to https://ziton.live/ to see error information");
      }
    } else {
      if (kDebugMode) {
        print(
            "failed to push errors to ziton dashboard !! \n Check your internet connection");
      }
    }
  } catch (error) {}
}

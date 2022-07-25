import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:ziton_error/src/context_info.dart';
import 'package:ziton_error/src/error_stack.dart';
import 'package:ziton_error/src/exception.dart';
import 'package:ziton_error/src/platform_info.dart';
import 'package:ziton_error/src/uri_details.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'error_file.dart';

/// collects error information from the error object
sendError(String dsn, FlutterErrorDetails errorDetails) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
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
          print("failed to push errors to ziton dashboard !!");
        }
      }
    } catch (error) {
      //skipp
    }
  } else {
    if (kDebugMode) {
      print("please connect to internet to push error details to ziton!!");
      print("name: ${exceptionName(errorDetails)}");
      print("error_file_name: ${errorFile(errorDetails)}");
      print("line_number: ${errorLine(errorDetails).toString()}");
      print("file: ${fileName(errorDetails)}");
      print("starting_line_number: ${startLine(errorDetails).toString()}");

      print("ending_line_number: ${endLine(errorDetails).toString()}");
      print("information: ${errorInfo(errorDetails)}");
      print("environment: ${runningMode()})");
      print("context: ${runningContext(errorDetails)}");
      print("library: ${runningLibrary(errorDetails)}");
      print("platform: ${platformInfo()}");
      print("screen: ${screenDetails()}");
      print("stack_trace: ${errorStack(errorDetails)}");
    }
  }
}

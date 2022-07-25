import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../context_info.dart';
import '../platform_info.dart';
import '../uri_details.dart';

Future<void> errorReport(
    String dsn, String msg, String fileName, String description) async {
  try {
    http.Response response = await http.post(Uri.parse(urRoute()), body: {
      "stack_trace": StackTrace.current.toString(),
      "name": msg,
      "error_file_name": fileName,
      "line_number": "0",
      "file": fileName,
      "starting_line_number": "0",
      "ending_line_number": "0",
      "information": description,
      "environment": runningMode(),
      "context": "not available",
      "library": "not available",
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
}

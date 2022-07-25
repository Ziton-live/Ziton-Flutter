import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:ziton_error/src/error_file.dart';

/// to parse the portion of code that causes the error
Future<List> errorLines(FlutterErrorDetails errorDetails) async {
  List<String> errorLines = [];
  int i = 0;
  try {
    //open and read the file
    await File(fileName(errorDetails))
        .openRead()
        .map(utf8.decode)
        .transform(const LineSplitter())
        .forEach((l) {
      if (i > (startLine(errorDetails)) && i < (endLine(errorDetails))) {
        errorLines.add(l.toString());
      }
      i++;
    });

    if (kDebugMode) {
      print(errorLines);
    }
  } catch (error) {
    if (kDebugMode) {
      print("cannot open file $fileName");
    }
  }
  return errorLines;
}

import 'package:flutter/material.dart';

String hostUrl()
{
  ///host url to which error details to be pushed
  String hostUrl = "https://api.ziton.live";
  return hostUrl;
}

String urRoute()
{
  ///content of parsing
  String uri = "${hostUrl()}/api/flutter/";
  return uri;
}
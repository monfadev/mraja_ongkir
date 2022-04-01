import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../config/environtment.dart';

abstract class HttpConnection {
  final BuildContext context;

  final Dio dio = Dio(BaseOptions(baseUrl: endpoint, headers: {
    "key": apiKey,
    "content-type": contentType,
  }));

  HttpConnection(this.context);
}

String prettyJson(dynamic json) {
  var space = ' ' * 4;
  var encoder = JsonEncoder.withIndent(space);
  return encoder.convert(json);
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mraja_ongkir/core/https/http_connection.dart';
import 'package:mraja_ongkir/core/models/province.dart';

import '../models/city.dart';

class RajaOngkirHttp extends HttpConnection {
  RajaOngkirHttp(BuildContext context) : super(context);

  Future<List<Province>> listOfProvince() async {
    try {
      var resp = await dio.get("province");
      if (resp.data != null && resp.statusCode == 200) {
        log(resp.data["rajaongkir"]["results"].toString());
        return resp.data!["rajaongkir"]["results"].map<Province>((item) => Province.fromJson(item)).toList();
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  Future<List<City>> listOfCity(String param) async {
    try {
      var resp = await dio.get("city?province=$param");
      if (resp.data != null && resp.statusCode == 200) {
        log(resp.data["rajaongkir"]["results"].toString());
        return resp.data!["rajaongkir"]["results"].map<City>((item) => City.fromJson(item)).toList();
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  Future<List<DestinationProvince>> listOfDestinationProvince() async {
    try {
      var resp = await dio.get("province");
      if (resp.data != null && resp.statusCode == 200) {
        log(resp.data["rajaongkir"]["results"].toString());
        return resp.data!["rajaongkir"]["results"].map<DestinationProvince>((item) => DestinationProvince.fromJson(item)).toList();
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  Future<List<DestinationCity>> listOfDestinationCity(String param) async {
    try {
      var resp = await dio.get("city?province=$param");
      if (resp.data != null && resp.statusCode == 200) {
        log(resp.data["rajaongkir"]["results"].toString());
        return resp.data!["rajaongkir"]["results"].map<DestinationCity>((item) => DestinationCity.fromJson(item)).toList();
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  //TODOS: APPLIED TO UI
  Future<bool> createOngkir() async {
    try {
      var body = {"origin": "501", "destination": "114", "weight": "1700", "courier": "jne"};
      var resp = await dio.post("cost", data: body);

      if (resp.data != null && resp.statusCode == 200) {
        log(resp.data.toString());
        return true;
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }
}

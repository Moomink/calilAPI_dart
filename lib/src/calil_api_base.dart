import 'APIs/library.dart';
import 'APIs/check.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiDomain = "api.calil.jp";

class Calil {
  final String _appkey;
  Calil(String appkey) : _appkey = appkey;

  // 図書館データベース
  Future<List<CalilLibrary>> library(
      {String pref = "",
      String city = "",
      String systemid = "",
      String geocode = "",
      int limit = 5}) async {
    const String path = '/library';

    Map<String, dynamic> query = {
      "appkey": _appkey,
      "pref": pref,
      "city": city,
      "systemid": systemid,
      "geocode": geocode,
      "limit": limit.toString(),
      "format": "json",
      "callback": "no"
    };

    final Uri uri = Uri.https(apiDomain, path, query);

    var client = http.Client();

    List<CalilLibrary> library = [];
    List<Map<String, dynamic>> getData = [];

    try {
      http.Response res;
      res = await client.get(uri);

      for (var value in jsonDecode(res.body)) {
        getData.add(value);
      }
    } catch (e) {
      throw Exception(e);
    } finally {
      client.close();

      if (getData.isEmpty) {
      } else {
        for (var value in getData) {
          library.add(CalilLibrary.fromJson(value));
        }
      }
    }

    return library;
  }

  Future<Map<String, Map<String, CalilCheck>>> check(
      {required List<String> isbn, required List<String> systemid}) async {
    const String path = '/check';

    Map<String, dynamic> query = {
      "appkey": _appkey,
      "isbn": isbn.join(","),
      "systemid": systemid.join(","),
      "format": "json",
      "callback": "no"
    };

    Map<String, Map<String, CalilCheck>> check = {};

    Uri uri = Uri.https(apiDomain, path, query);

    var client = http.Client();
    Map data;
    try {
      http.Response res;
      while (true) {
        res = await client.get(uri);
        if (jsonDecode(res.body)["continue"] == 1) {
          query = {
            "format": "json",
            "callback": "no",
            "session": jsonDecode(res.body)["session"]
          };
          uri = Uri.https(apiDomain, path, query);
          await Future.delayed(Duration(seconds: 2));
          continue;
        } else {
          break;
        }
      } //TODO check

      data = jsonDecode(res.body);
    } catch (e) {
      throw Exception(e);
    } finally {
      client.close();
    }
    // add library list
    data["books"].forEach((_isbn, libs) {
      Map<String, CalilCheck> data = {};
      CalilCheck library;

      libs.forEach((libName, values) {
        library = CalilCheck(
            status: values["status"],
            reserveurl: Uri.parse(values["reserveurl"]),
            libkey: Map<String, String>.from(values["libkey"]));
        data.addAll({libName: library});
      });
      check.addAll({_isbn: data});
    });
    return check;
  }
}

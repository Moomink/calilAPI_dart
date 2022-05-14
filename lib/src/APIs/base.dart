import 'library.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

final String apiDomain = "api.calil.jp";

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
    final String path = '/library';

    Map<String, dynamic> query = {
      "appkey": _appkey,
      "pref": pref,
      "city": city,
      "systemid": systemid,
      "geocode": geocode,
      "limit": limit,
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

      getData = jsonDecode(res.body);
    } catch (e) {
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
}

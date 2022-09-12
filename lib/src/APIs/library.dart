import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiDomain = "api.calil.jp";

class CalilLibrary {
  final String systemid;
  final String systemname;
  final String libkey;
  final String libid;
  final String short;
  final String formal;
  final String url_pc;
  final String address;
  final String pref;
  final String city;
  final String post;
  final String tel;
  final String geocode;
  final String category;
  final String? image;
  final int? distance;
  final String? isid;
  final String? faid;

  static CalilLibrary fromJson(Map<String, dynamic> json) {
    CalilLibrary libraryData;

    if (json.containsKey("distance")) {
      libraryData = CalilLibrary(
          systemid: json["systemid"],
          systemname: json["systemname"],
          libkey: json["libkey"],
          libid: json["libid"],
          short: json["short"],
          formal: json["formal"],
          url_pc: json["url_pc"],
          address: json["address"],
          pref: json["pref"],
          city: json["city"],
          post: json["post"],
          tel: json["tel"],
          geocode: json["geocode"],
          category: json["category"],
          isid: json["isid"],
          faid: json["faid"],
          distance: json["distance"]);
    } else {
      libraryData = CalilLibrary(
          systemid: json["systemid"],
          systemname: json["systemname"],
          libkey: json["libkey"],
          libid: json["libid"],
          short: json["short"],
          formal: json["formal"],
          url_pc: json["url_pc"],
          address: json["address"],
          pref: json["pref"],
          city: json["city"],
          post: json["post"],
          tel: json["tel"],
          geocode: json["geocode"],
          category: json["category"],
          isid: json["isid"],
          faid: json["faid"]);
    }

    return libraryData;
  }

  CalilLibrary(
      {required this.systemid,
      required this.systemname,
      required this.libkey,
      required this.libid,
      required this.short,
      required this.formal,
      required this.url_pc,
      required this.address,
      required this.pref,
      required this.city,
      required this.post,
      required this.tel,
      required this.geocode,
      required this.category,
      this.image,
      this.distance,
      this.isid,
      this.faid});
}

Future<List<CalilLibrary>> searchLibrary(
    {required String appkey,
    String pref = "",
    String city = "",
    String systemid = "",
    String geocode = "",
    int limit = 5}) async {
  const String path = '/library';

  Map<String, dynamic> query = {
    "appkey": appkey,
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

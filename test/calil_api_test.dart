import 'package:calil_api/calil_api.dart';
import 'dart:io';
import 'package:test/test.dart';

void main() {
  final String? apikey = Platform.environment["CALIL_APIKEY"];
  if (apikey == null) {
    throw Exception("Not Set Env \"CALIL_APIKEY\"");
  } else if (apikey.isEmpty) {
    throw Exception("CALIL_APIKEY is not contains anything.");
  }
  print("Calil ApiKey is $apikey.");

  group("Search Library ", () {
    test("API Response", () async {
      var calil = Calil(apikey[0]);

      List<CalilLibrary> res =
          await calil.library(systemid: "Univ_Kisaraze_Ct");

      expect(res.isEmpty, isFalse);
      expect(res[0].libid, "111549");
      expect(res[0].url_pc, "https://www.kisarazu.ac.jp/lib.html");
    });
  });

  group("Collection Search", () {
    test("API Response", () async {
      var calil = Calil(apikey[0]);

      Map<String, Map<String, CalilCheck>> res = await calil.check(
          isbn: <String>["4062091542"],
          systemid: <String>["Univ_Kisaraze_Ct", "Univ_Seiwa"]);

      expect(res.containsKey("4062091542"), isTrue);
      expect(res["4062091542"]!["Univ_Seiwa"]!.libkey["図書館"], "貸出可");
      expect(
          res["4062091542"]!["Univ_Seiwa"]!.reserveurl,
          Uri(
              scheme: 'https',
              host: 'libopac3-c.nagaokaut.ac.jp',
              path: '/opac/opac_details/',
              queryParameters: {
                'lang': 0,
                'amode': 11,
                'bibid': 1013026374,
                'kscode': 015
              }));
    });
  });
}

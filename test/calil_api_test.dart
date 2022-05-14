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
}

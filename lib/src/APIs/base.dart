import 'library.dart';
import 


final String apiDomain = "api.calil.jp";

class Calil {
  final String _appkey;
  Calil(String appkey) : this._appkey = appkey;

  // 図書館データベース
  Future<CalilLibrary> library(
      {String pref = "",
      String city = "",
      String systemid = "",
      String geocode = "",
      int limit = 5}) {

      final String path = '/library';

    Map<String, dynamic> query = {
      "appkey": _appkey,
      "pref": pref,
      "city": city,
      "systemid": systemid,
      "geocode": geocode,
      "limit": limit
    };

    var uri = Uri.https(apiDomain,path,query);


  }
}

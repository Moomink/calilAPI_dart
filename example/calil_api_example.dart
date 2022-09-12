import 'package:calil_api/calil_api.dart';

void main() async {
  var key = "<<CALIL API KEY>>";
  var libraryList =
      await searchLibrary(appkey: key, systemid: "Univ_Kisaraze_Ct");

  libraryList.forEach((v) {
    print(v.systemname);
  });
}

import 'package:calil_api/calil_api.dart';

void main() async {
  var calil = Calil("<Calil Api Key>");

  List<CalilLibrary> library =
      await calil.library(systemid: "Univ_Kisaraze_Ct");

  print("lbrary Name: ${library[0].systemname}");
}

class CalilCheck {
  final String status;
  final Uri reserveurl;
  final Map<String, String> libkey;

  CalilCheck(
      {required this.status, required this.reserveurl, required this.libkey});

  static CalilCheck fromJson(Map<String, dynamic> json) {
    CalilCheck checkData;
    checkData = CalilCheck(
        status: json["status"],
        reserveurl: Uri.parse(json["reserveurl"]),
        libkey: json["libkey"]);

    return checkData;
  }
}

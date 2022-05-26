class CalilCheck {
  final String status;
  final Uri reserveurl;
  final String libkey;

  CalilCheck(
      {required this.status, required this.reserveurl, required this.libkey});

  static CalilCheck fromJson(Map<String, dynamic> json) {
    CalilCheck checkData;
    checkData = CalilCheck(
        status: json["status"],
        reserveurl: json["reserveurl"],
        libkey: json["libkey"]);

    return checkData;
  }
}

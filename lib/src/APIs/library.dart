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

//TODO add enum
//enum Category { SMALL, MEDIUM, LAGRE, UNIV, SPECIAL, BM }

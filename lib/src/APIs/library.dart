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
  final Category category;
  final String? image;
  final int? distance;

  CalilLibrary({
    required this.systemid,
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
  });
}

enum Category { small, medium, lagre, univ, special, bm }

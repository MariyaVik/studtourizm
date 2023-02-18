enum RegionAbb {
  al,
  amu,
  ark,
  ast,
  bel,
  bry,
  vla,
  vgg,
  vlg,
  vor,
  dnr,
  yev,
  zab,
  msk,
  sbp
}

class Region {
  final int code;
  final RegionAbb codeISO;
  final String name;
  final double lat;
  final double lng;
  Region(
      {required this.code,
      required this.codeISO,
      required this.name,
      this.lat = 55.7522,
      this.lng = 37.6156});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Region && code == other.code;

  @override
  int get hashCode => code;
}

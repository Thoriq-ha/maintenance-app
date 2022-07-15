class Data {
  List<Verification>? verification;

  Data({this.verification});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      verification = <Verification>[];
      json['data'].forEach((v) {
        verification?.add(Verification.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (verification != null) {
      data['data'] = verification?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Verification {
  Verification(
      {required this.id,
      required this.alatId,
      required this.stasiunId,
      required this.mingguke,
      required this.hasilPenilaian,
      required this.isVerified,
      required this.namaAlat,
      required this.isSelect});
  late final int id;
  late final String alatId;
  late final String stasiunId;
  late final String mingguke;
  late final String hasilPenilaian;
  late final String isVerified;
  late final String namaAlat;
  late final bool isSelect;

  Verification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alatId = json['alat_id'];
    stasiunId = json['stasiun_id'];
    mingguke = json['mingguke'];
    hasilPenilaian = json['hasil_penilaian'];
    isVerified = json['is_verified'];
    namaAlat = json['alat']['nama_wesel_or_sinyal'];
    isSelect = false;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['alat_id'] = alatId;
    _data['stasiun_id'] = stasiunId;
    _data['mingguke'] = mingguke;
    _data['hasil_penilaian'] = hasilPenilaian;
    _data['alat']['nama_wesel_or_sinyal'] = namaAlat;
    _data['is_verified'] = isVerified;
    return _data;
  }

  Verification copyWith(
      {int? id,
      String? alatId,
      String? stasiunId,
      String? mingguke,
      String? hasilPenilaian,
      String? isVerified,
      String? namaAlat,
      bool? isSelect}) {
    return Verification(
        id: id ?? this.id,
        alatId: alatId ?? this.alatId,
        stasiunId: stasiunId ?? this.stasiunId,
        mingguke: mingguke ?? this.mingguke,
        hasilPenilaian: hasilPenilaian ?? this.hasilPenilaian,
        isVerified: isVerified ?? this.isVerified,
        namaAlat: namaAlat ?? this.namaAlat,
        isSelect: isSelect ?? this.isSelect);
  }
}

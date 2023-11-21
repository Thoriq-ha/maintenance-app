// ignore_for_file: file_names

class Data {
  List<Alat>? alat;

  Data({this.alat});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      alat = <Alat>[];
      json['data'].forEach((v) {
        alat?.add(Alat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (alat != null) {
      data['data'] = alat?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Alat {
  Alat({
    required this.id,
    required this.stasiunId,
    required this.tipe,
    required this.namaWeselOrSinyal,
    required this.slug,
    required this.qrcode,
    required this.isChecking,
  });
  late final String id;
  late final String stasiunId;
  late final String tipe;
  late final String namaWeselOrSinyal;
  late final String slug;
  late final String qrcode;
  late final String isChecking;

  Alat.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    stasiunId = json['stasiun_id'].toString();
    tipe = json['tipe'].toString();
    namaWeselOrSinyal = json['nama_wesel_or_sinyal'].toString();
    slug = json['slug'].toString();
    qrcode = json['qrcode'].toString();
    isChecking = json['is_checking'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['stasiun_id'] = stasiunId;
    _data['tipe'] = tipe;
    _data['nama_wesel_or_sinyal'] = namaWeselOrSinyal;
    _data['slug'] = slug;
    _data['qrcode'] = qrcode;
    _data['is_checking'] = isChecking;
    return _data;
  }
}

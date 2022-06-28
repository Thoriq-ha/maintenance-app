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
    // required this.note,
    required this.createdAt,
    required this.updatedAt,
    required this.stasiun,
  });
  late final int id;
  late final String stasiunId;
  late final String tipe;
  late final String namaWeselOrSinyal;
  late final String slug;
  late final String qrcode;
  // late final String note;
  late final String createdAt;
  late final String updatedAt;
  late final Stasiun stasiun;

  Alat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stasiunId = json['stasiun_id'];
    tipe = json['tipe'];
    namaWeselOrSinyal = json['nama_wesel_or_sinyal'];
    slug = json['slug'];
    qrcode = json['qrcode'];
    // note = json['note'] as String;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stasiun = Stasiun.fromJson(json['stasiun']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['stasiun_id'] = stasiunId;
    _data['tipe'] = tipe;
    _data['nama_wesel_or_sinyal'] = namaWeselOrSinyal;
    _data['slug'] = slug;
    _data['qrcode'] = qrcode;
    // _data['note'] = note;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['stasiun'] = stasiun.toJson();
    return _data;
  }
}

class Stasiun {
  Stasiun({
    required this.id,
    required this.userId,
    required this.namaStasiun,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String userId;
  late final String namaStasiun;
  late final String createdAt;
  late final String updatedAt;

  Stasiun.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    namaStasiun = json['nama_stasiun'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['nama_stasiun'] = namaStasiun;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

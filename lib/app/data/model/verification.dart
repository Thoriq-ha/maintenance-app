import 'package:maintenance_app/app/data/model/alat.dart';

class Verification {
  int? id;
  int? alatId;
  int? stasiunId;
  int? mingguke;
  String? hasilPenilaian;
  int? isVerified;
  String? createdAt;
  String? updatedAt;
  String? tanggalVerifikasi;
  String? pPKASId;
  bool? isSelect;
  Alat? alat;

  Verification(
      {this.id,
      this.alatId,
      this.stasiunId,
      this.mingguke,
      this.hasilPenilaian,
      this.isVerified,
      this.createdAt,
      this.updatedAt,
      this.tanggalVerifikasi,
      this.pPKASId,
      this.alat,
      this.isSelect});

  Verification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alatId = json['alat_id'];
    stasiunId = json['stasiun_id'];
    mingguke = json['mingguke'];
    hasilPenilaian = json['hasil_penilaian'];
    isVerified = json['is_verified'];
    isSelect = (json['is_verified'] == 1) ? true : false;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    tanggalVerifikasi = json['tanggal_verifikasi'];
    pPKASId = json['p_p_k_a_s_id'];
    alat = json['alat'] != null ? Alat.fromJson(json['alat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['alat_id'] = alatId;
    data['stasiun_id'] = stasiunId;
    data['mingguke'] = mingguke;
    data['hasil_penilaian'] = hasilPenilaian;
    data['is_verified'] = isVerified;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['tanggal_verifikasi'] = tanggalVerifikasi;
    data['p_p_k_a_s_id'] = pPKASId;
    if (alat != null) {
      data['alat'] = alat!.toJson();
    }
    return data;
  }

  Verification copyWith(
      {int? id,
      int? alatId,
      int? stasiunId,
      int? mingguke,
      String? hasilPenilaian,
      int? isVerified,
      bool? isSelect}) {
    return Verification(
        id: id ?? this.id,
        alatId: alatId ?? this.alatId,
        stasiunId: stasiunId ?? this.stasiunId,
        mingguke: mingguke ?? this.mingguke,
        hasilPenilaian: hasilPenilaian ?? this.hasilPenilaian,
        isVerified: isVerified ?? this.isVerified,
        isSelect: isSelect ?? this.isSelect);
  }
}

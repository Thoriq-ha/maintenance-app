class DataForm {
  int? id;
  String? namaJenisItem;
  String? createdAt;
  String? updatedAt;
  List<Golongans>? golongans;

  DataForm(
      {this.id,
      this.namaJenisItem,
      this.createdAt,
      this.updatedAt,
      this.golongans});

  DataForm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaJenisItem = json['nama_jenis_item'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['golongans'] != null) {
      golongans = <Golongans>[];
      json['golongans'].forEach((v) {
        golongans!.add(new Golongans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_jenis_item'] = this.namaJenisItem;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.golongans != null) {
      data['golongans'] = this.golongans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Golongans {
  int? id;
  int? jenisItemId;
  String? namaGolongan;
  String? createdAt;
  String? updatedAt;
  List<Items>? items;

  Golongans(
      {this.id,
      this.jenisItemId,
      this.namaGolongan,
      this.createdAt,
      this.updatedAt,
      this.items});

  Golongans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jenisItemId = json['jenis_item_id'];
    namaGolongan = json['nama_golongan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['jenis_item_id'] = this.jenisItemId;
    data['nama_golongan'] = this.namaGolongan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  int? golonganJenisItemId;
  String? namaItem;
  String? standar;
  String? tag;
  String? createdAt;
  String? updatedAt;

  Items(
      {this.id,
      this.golonganJenisItemId,
      this.namaItem,
      this.standar,
      this.tag,
      this.createdAt,
      this.updatedAt});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    golonganJenisItemId = json['golongan_jenis_item_id'];
    namaItem = json['nama_item'];
    standar = json['standar'];
    tag = json['tag'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['golongan_jenis_item_id'] = this.golonganJenisItemId;
    data['nama_item'] = this.namaItem;
    data['standar'] = this.standar;
    data['tag'] = this.tag;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

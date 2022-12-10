class Anggota {
  late int? id;
  late String nama;
  late String jabatan;
  late String bidang;
  late String keterangan;

  Anggota({
    this.id,
    required this.nama,
    required this.jabatan,
    required this.bidang,
    required this.keterangan,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'jabatan': jabatan,
      'bidang': bidang,
      'keterangan': keterangan,
    };
  }

  Anggota.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nama = map['nama'];
    jabatan = map['jabatan'];
    bidang = map['bidang'];
    keterangan = map['keterangan'];
  }
}

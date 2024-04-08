import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;

class PenggunaModel {
  // lokal
  String nik; // unik
  String email;
  String nama;
  String alamat;
  String noHp;
  Timestamp tanggalDaftar;
  String fotoURL;
  // Tamu {embedded}
  List<Map<String, dynamic>>? tamu;

  PenggunaModel({
    required this.nik,
    required this.email,
    required this.nama,
    required this.alamat,
    required this.noHp,
    required this.tanggalDaftar,
    required this.fotoURL,
    this.tamu,
  });

  // Method untuk mengonversi objek PenggunaModel menjadi Map<String, dynamic>
  // agar dapat disimpan di Firestore
  Map<String, dynamic> toMap() {
    return {
      'nik': nik,
      'email': email,
      'nama': nama,
      'alamat': alamat,
      'noHp': noHp,
      'tanggalDaftar': tanggalDaftar,
      'fotoURL': fotoURL,
      'tamu': tamu ?? [],
    };
  }

  // Method untuk mengonversi data dari Firestore menjadi objek PenggunaModel
  factory PenggunaModel.fromMap(Map<String, dynamic> map) {
    return PenggunaModel(
      nik: map['nik'],
      email: map['email'],
      nama: map['nama'],
      alamat: map['alamat'],
      noHp: map['noHp'],
      tanggalDaftar: map['tanggalDaftar'],
      fotoURL: map['fotoURL'],
      tamu: List<Map<String, dynamic>>.from(map['tamu']),
    );
  }
}

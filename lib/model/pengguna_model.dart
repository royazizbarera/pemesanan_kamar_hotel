import 'dart:math';

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

  PenggunaModel({
    required this.nik,
    required this.email,
    required this.nama,
    required this.alamat,
    required this.noHp,
    required this.tanggalDaftar,
    required this.fotoURL,
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
    );
  }

  // Model random
  factory PenggunaModel.random() {
    dynamic getRandomElement(List<dynamic> list) {
      final random = Random();
      return list[random.nextInt(list.length)];
    }

    List<String> nama = [
      'Budi',
      'Andi',
      'Joko',
      'Siti',
      'Rina',
      'Dewi',
      'Rudi',
      'Dodi',
      'Dewa',
      'Dewi',
    ];
    List<String> email = [
      '@gmail.com',
      '@yahoo.com',
      '@hotmail.com',
      '@mail.com',
      '@outlook.com',
    ];
    List<String> alamat = [
      'Jl. A',
      'Jl. B',
      'Jl. C',
      'Jl. D',
      'Jl. E',
      'Jl. F',
      'Jl. G',
      'Jl. H',
      'Jl. I',
      'Jl. J',
    ];
    List<String> noHp = [
      '081287630912',
      '081387630912',
      '081487630912',
      '081587630912',
      '081687630912',
      '081787630912',
      '081887630912',
      '081987630912',
      '082187630912',
      '082287630912',
    ];
    // list nik random
    List<String> nik = [
      '1234567890123456',
      '2345678901234567',
      '3456789012345678',
      '4567890123456789',
      '5678901234567890',
      '6789012345678901',
      '7890123456789012',
      '8901234567890123',
      '9012345678901234',
      '0123456789012345',
    ];
    String currName = getRandomElement(nama);
    String currMail = currName + getRandomElement(email);
    return PenggunaModel(
      nik: getRandomElement(nik),
      email: currMail,
      nama: currName,
      alamat: getRandomElement(alamat),
      noHp: getRandomElement(noHp),
      tanggalDaftar: Timestamp.now(),
      fotoURL: 'https://avatars.githubusercontent.com/u/126170803?s=40&v=4',
    );
  }
}

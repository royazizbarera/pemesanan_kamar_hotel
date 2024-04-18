import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;
import 'package:pemesanan_kamar_hotel/enum/status_pemesanan.dart';
import 'package:pemesanan_kamar_hotel/model/kamar_model.dart';
import 'package:pemesanan_kamar_hotel/model/pembayaran_model.dart';
import 'package:pemesanan_kamar_hotel/model/pengguna_model.dart';
import 'package:pemesanan_kamar_hotel/model/tamu_model.dart';
import 'package:uuid/uuid.dart';

class PemesananModel {
  // Atribut
  String? idPemesanan; // random
  Timestamp tanggalPemesanan;
  String statusPemesanan;
  int durasiMenginap; // Malam
  Timestamp tanggalCheckIn;
  Timestamp tanggalCheckOut;

  // embedded
  KamarModel kamar;
  PenggunaModel pemesan;
  PembayaranModel pembayaran;
  // List<TamuModel>? tamu;

  // Konstruktor
  PemesananModel({
    this.idPemesanan,
    required this.tanggalPemesanan,
    required this.statusPemesanan,
    required this.kamar,
    required this.pemesan,
    required this.pembayaran,
    required this.durasiMenginap,
    required this.tanggalCheckIn,
    required this.tanggalCheckOut,
    // this.tamu,
  }) {
    idPemesanan ??= const Uuid().v4();
  }

  // Method untuk mengonversi objek PemesananModel menjadi Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'idPemesanan': idPemesanan,
      'tanggalPemesanan': tanggalPemesanan,
      'statusPemesanan': statusPemesanan,
      'kamar': kamar.toMap(),
      'pemesan': pemesan.toMap(),
      'pembayaran': pembayaran.toMap(),
      'durasiMenginap': durasiMenginap,
      'tanggalCheckIn': tanggalCheckIn,
      'tanggalCheckOut': tanggalCheckOut,
      // 'tamu': tamu?.map((element) => element.toMap()).toList(),
    };
  }

  // Method untuk mengonversi data dari Firestore menjadi objek PemesananModel
  factory PemesananModel.fromMap(Map<String, dynamic> map) {
    map['tamu'] ??= [];
    return PemesananModel(
      idPemesanan: map['idPemesanan'],
      tanggalPemesanan: map['tanggalPemesanan'],
      statusPemesanan: map['statusPemesanan'],
      kamar: KamarModel.fromMap(map['kamar']),
      pemesan: PenggunaModel.fromMap(map['pemesan']),
      pembayaran: PembayaranModel.fromMap(map['pembayaran']),
      durasiMenginap: map['durasiMenginap'],
      tanggalCheckIn: map['tanggalCheckIn'],
      tanggalCheckOut: map['tanggalCheckOut'],
      // tamu: List.generate((map['tamu'] as List).length,
      //     (index) => TamuModel.fromMap(map['tamu'][index])),
    );
  }

  // Create data random
  factory PemesananModel.random({
    required KamarModel kamar,
    required PenggunaModel pemesan,
    int? durasiMenginap,
  }) {
    durasiMenginap ??= 1;
    return PemesananModel(
      idPemesanan: const Uuid().v4(),
      tanggalPemesanan: Timestamp.fromDate(DateTime.now()),
      statusPemesanan: StatusPemesanan.menungguPembayaran.status,
      kamar: kamar,
      pemesan: pemesan,
      pembayaran: PembayaranModel(jumlahPembayaran: kamar.hargaSewa),
      durasiMenginap: durasiMenginap,
      tanggalCheckIn: Timestamp.fromDate(DateTime.now()),
      tanggalCheckOut: Timestamp.fromDate(DateTime.now()),
      // tamu: List.generate(1, (index) => TamuModel.random()),
    );
  }
}

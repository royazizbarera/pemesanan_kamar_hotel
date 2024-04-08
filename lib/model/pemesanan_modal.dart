import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;
import 'package:pemesanan_kamar_hotel/model/kamar_model.dart';
import 'package:pemesanan_kamar_hotel/model/pembayaran_model.dart';
import 'package:pemesanan_kamar_hotel/model/pengguna_model.dart';
import 'package:pemesanan_kamar_hotel/model/tamu_model.dart';

class PemesananModel {
  // Atribut
  String idPemesanan;
  Timestamp tanggalPemesanan;
  String statusPemesanan;

  // embedded
  KamarModel kamar;
  PenggunaModel pemesan;
  PembayaranModel pembayaran;
  List<TamuModel>? tamu;

  // Konstruktor
  PemesananModel({
    required this.idPemesanan,
    required this.tanggalPemesanan,
    required this.statusPemesanan,
    required this.kamar,
    required this.pemesan,
    required this.pembayaran,
    this.tamu,
  });

  // Method untuk mengonversi objek PemesananModel menjadi Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'idPemesanan': idPemesanan,
      'tanggalPemesanan': tanggalPemesanan,
      'statusPemesanan': statusPemesanan,
      'kamar': kamar.toMap(),
      'pemesan': pemesan.toMap(),
      'pembayaran': pembayaran.toMap(),
      'tamu': tamu?.map((element) => element.toMap()).toList(),
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
      tamu: List.generate((map['tamu'] as List).length,
          (index) => TamuModel.fromMap(map['tamu'][index])),
    );
  }
}

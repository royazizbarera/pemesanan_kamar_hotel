import 'package:pemesanan_kamar_hotel/enum/status_pembayaran.dart';
import 'package:uuid/uuid.dart';

class PembayaranModel {
  // Pembayaran {local}
  String? idPembayaran;
  double jumlahPembayaran;
  String? statusPembayaran;

  PembayaranModel({
    this.idPembayaran,
    required this.jumlahPembayaran,
    this.statusPembayaran,
  }) {
    idPembayaran ??= const Uuid().v4();
    statusPembayaran ??= StatusPembayaran.menungguPembayaran.status;
  }

  // Method untuk mengonversi objek PembayaranModel menjadi Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'idPembayaran': idPembayaran,
      'jumlahPembayaran': jumlahPembayaran,
      'statusPembayaran': statusPembayaran,
    };
  }

  // Method untuk mengonversi data dari Firestore menjadi objek PembayaranModel
  factory PembayaranModel.fromMap(Map<String, dynamic> map) {
    return PembayaranModel(
      idPembayaran: map['idPembayaran'],
      jumlahPembayaran: map['jumlahPembayaran'],
      statusPembayaran: map['statusPembayaran'],
    );
  }

}

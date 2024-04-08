class PembayaranModel {
  // Pembayaran {local}
  String idPembayaran;
  double jumlahPembayaran;
  String statusPembayaran;

  PembayaranModel({
    required this.idPembayaran,
    required this.jumlahPembayaran,
    required this.statusPembayaran,
  });

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

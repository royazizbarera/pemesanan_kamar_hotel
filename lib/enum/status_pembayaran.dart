enum StatusPembayaran {
  menungguPembayaran("Menunggu Pembayaran"),
  pembayaranDiterima("Pembayaran Diterima"),
  pembayaranDitolak("Pembayaran Ditolak"),
  pembayaranDibatalkan("Pembayaran Dibatalkan"),
  pembayaranSelesai("Pembayaran Selesai");

  final String status;

  const StatusPembayaran(this.status);

}
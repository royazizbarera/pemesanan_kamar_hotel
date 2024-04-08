enum StatusPemesanan {
  menungguPembayaran("Menunggu Pembayaran"),
  pemesananDiterima("Pemesanan Diterima"),
  pemesananDitolak("Pemesanan Ditolak"),
  pemesananDibatalkan("Pemesanan Dibatalkan"),
  pemesananSelesai("Pemesanan Selesai");

  final String status;

  const StatusPemesanan(this.status);
}
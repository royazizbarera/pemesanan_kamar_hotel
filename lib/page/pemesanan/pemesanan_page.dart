// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pemesanan_kamar_hotel/model/pemesanan_model.dart';

class PemesananPage extends StatefulWidget {
  final PemesananModel pemesanan;
  const PemesananPage({super.key, required this.pemesanan});

  @override
  State<PemesananPage> createState() => _PemesananPageState();
}

class _PemesananPageState extends State<PemesananPage> {
  TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  TextStyle subtitleStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  TextStyle contentStyle = TextStyle(
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemesanan'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Back
              // Order Detail
              cardDetailPemesanan(),
              // Contact Details
            ],
          ),
        ),
      ),
    );
  }

  Widget cardDetailPemesanan() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text('Detail Pesanan', style: titleStyle),
            // Alamat
            alamat(),
            // Phone, Email
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                email(),
                telepon(),
              ],
            ),
            checkInOut(),
            stay()
          ],
        ),
      ),
    );
  }

  Widget stay() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Durasi Menginap',
                style: subtitleStyle,
              ),
              Text(
                '${widget.pemesanan.durasiMenginap}',
                style: contentStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kapasitas Kamar',
                style: subtitleStyle,
              ),
              Text(
                '${widget.pemesanan.kamar.kapasitasKamar} ',
                style: contentStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget checkInOut() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tanggal Check-in',
                style: subtitleStyle,
              ),
              Text(
                '${widget.pemesanan.tanggalCheckIn.toDate()}',
                style: contentStyle,
              ),
              Text(
                '14.00 WIB',
                style: contentStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tanggal Check-out',
                style: subtitleStyle,
              ),
              Text(
                '${widget.pemesanan.tanggalCheckOut.toDate()}',
                style: contentStyle,
              ),
              Text(
                '12.00 WIB',
                style: contentStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget email() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Icon(Icons.phone),
              Text(
                '${widget.pemesanan.pemesan.email} ',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget alamat() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alamat',
            style: subtitleStyle,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_on),
              Text(
                '${widget.pemesanan.pemesan.alamat} ',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget telepon() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Telepon',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Icon(Icons.phone),
                Text(
                  '${widget.pemesanan.pemesan.noHp} ',
                ),
              ],
            ),
          ],
        ),
      );
}

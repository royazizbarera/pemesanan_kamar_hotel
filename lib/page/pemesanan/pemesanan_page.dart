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
  bool agree = false;

  TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  TextStyle typeRoomStyleBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle typeRoomStyleRegular = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Back
              // Order Detail
              Expanded(child: cardDetailPemesanan()),
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Detail Harga', style: titleStyle),
                      SizedBox(height: 8),
                      pembayaran(),
                      SizedBox(height: 8),
                      Divider(),
                      SizedBox(height: 8),
                      // Checkbox agree with terms and conditions
                      agreeTerms(),
                      SizedBox(height: 8),
                      // button payment
                      tombolLanjutkanPembayaran(context),
                    ],
                  ),
                ),
              ),
              // Contact Details
            ],
          ),
        ),
      ),
    );
  }

  Widget tombolLanjutkanPembayaran(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!agree) {
          // snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.error,
              content: Text('Anda harus menyetujui syarat dan ketentuan'),
            ),
          );
        }
      },
      child: FilledButton(
        onPressed: agree ? () {} : null,
        child: Text('Lanjutkan Pembayaran'),
      ),
    );
  }

  Widget agreeTerms() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: agree,
          onChanged: (value) {
            setState(() {
              agree = value!;
            });
          },
        ),
        Text('Saya menyetujui syarat dan ketentuan'),
      ],
    );
  }

  Widget pembayaran() {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.pemesanan.kamar.tipeKamar} ${widget.pemesanan.kamar.nomorKamar}',
                  style: typeRoomStyleBold,
                ),
                Text(
                  'Rp. ${widget.pemesanan.kamar.hargaSewa}',
                  style: typeRoomStyleRegular,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pajak tambahan',
                  style: contentStyle,
                ),
                Text(
                  'Rp. -',
                  style: contentStyle,
                ),
              ],
            ),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Pembayaran',
                  style: typeRoomStyleBold,
                ),
                Text(
                  'Rp. ${widget.pemesanan.kamar.hargaSewa}',
                  style: typeRoomStyleRegular,
                ),
              ],
            ),
          ],
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
                Expanded(child: email()),
                Expanded(child: telepon()),
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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Durasi Menginap',
                  style: subtitleStyle,
                ),
                Text(
                  '${widget.pemesanan.durasiMenginap} Malam',
                  style: contentStyle,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
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
        ),
      ],
    );
  }

  Widget checkInOut() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Padding(
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
        ),
        Expanded(
          child: Padding(
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

  Widget telepon() {
    return Padding(
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
}

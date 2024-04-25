import 'package:firebase_core/firebase_core.dart'
    show Firebase, FirebaseOptions;
import 'package:flutter/material.dart';
import 'package:pemesanan_kamar_hotel/model/kamar_model.dart';
import 'package:pemesanan_kamar_hotel/model/pemesanan_model.dart';
import 'package:pemesanan_kamar_hotel/model/pengguna_model.dart';
import 'package:pemesanan_kamar_hotel/page/home_page.dart';
import 'package:pemesanan_kamar_hotel/page/pemesanan/pemesanan_page.dart';

void main() async {
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC3YSQarsyAOKEnkU710bYHicAzlVTtfM4",
          authDomain: "pemesanan-kamar-hotel.firebaseapp.com",
          projectId: "pemesanan-kamar-hotel",
          storageBucket: "pemesanan-kamar-hotel.appspot.com",
          messagingSenderId: "593072490730",
          appId: "1:593072490730:web:ebfc6f16a6665fadacef93",
          measurementId: "G-DZ3397RZKW"));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  Widget pemesananPage() {
    return PemesananPage(
      pemesanan: PemesananModel.random(
          kamar: KamarModel.random(), pemesan: PenggunaModel.random()),
    );
  }

  Widget homePage() {
    return const HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        theme:
            ThemeData(colorSchemeSeed: const Color.fromARGB(255, 24, 157, 171)),
        debugShowCheckedModeBanner: false,
        home: pemesananPage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pemesanan_kamar_hotel/material/appbar_material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMaterial(context),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
          onTap: () {},
        );
      }),
    );
  }
}

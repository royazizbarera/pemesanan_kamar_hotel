import 'package:flutter/material.dart';
import 'package:pemesanan_kamar_hotel/material/searchbar_material.dart';



AppBar appBarMaterial(BuildContext context) {
  return AppBar(
    shadowColor: Theme.of(context).colorScheme.primary,
    toolbarHeight: 60,
    elevation: 0.5,
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Hotel Kelompok 4',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    ),
    actions: [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(height: 40, child: SearchBarMaterial()),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Tooltip(
          message: "Pesanan",
          child: ElevatedButton(
            onPressed: () {},
            child: const Badge(child: Icon(Icons.shopping_cart)),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Tooltip(
          message: "Pembayaran",
          child: ElevatedButton(
            onPressed: () {},
            child: const Badge(child: Icon(Icons.payment)),
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: VerticalDivider(),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.login_outlined),
          label: const Text(
            'Masuk',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.person_add,
              color: Theme.of(context).colorScheme.onPrimary),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.primary),
          ),
          label: Text('Daftar',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
        ),
      ),
    ],
  );
}

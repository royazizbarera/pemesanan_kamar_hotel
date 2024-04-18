import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pemesanan_kamar_hotel/controller/auth_controller.dart';
import 'package:pemesanan_kamar_hotel/material/carousel_banner.dart';
import 'package:pemesanan_kamar_hotel/material/kamar_card.dart';
import 'package:pemesanan_kamar_hotel/material/searchbar_material.dart';
import 'package:pemesanan_kamar_hotel/model/kamar_model.dart';
import 'package:pemesanan_kamar_hotel/page/auth/signin_page.dart';
import 'package:pemesanan_kamar_hotel/page/auth/signup_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool parallax = true;
  AuthController authController = AuthController();
  User? currentUser;
  List<KamarModel> kamarModel = [];
  // List<String> tipeKamar = ['Twin', 'King', 'Standard'];
  // List<String> kamarURL = [
  //   'https://images.pexels.com/photos/2467285/pexels-photo-2467285.jpeg?cs=srgb&dl=pexels-julie-aagaard-2467285.jpg&fm=jpg',
  //   'https://images.unsplash.com/photo-1629140727571-9b5c6f6267b4?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGhvdGVsJTIwcm9vbXxlbnwwfHwwfHx8MA%3D%3D',
  //   'https://images.unsplash.com/photo-1681370787860-eea901df92fe?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  //   'https://plus.unsplash.com/premium_photo-1676319481328-21e11d1048a7?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGJlZHJvb21zfGVufDB8fDB8fHww',
  // ];

  void getCurrentUser() {
    setState(() {
      currentUser = authController.getCurrentUser();
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    kamarModel = List.generate(
      20,
      (index) {
        return KamarModel.random();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMaterial(context),
      body: customScrollView(context),
    );
  }

  AppBar appBarMaterial(BuildContext context) {
    bool isSignedIn = currentUser != null;
    double width = MediaQuery.of(context).size.width;
    List<Widget>? actions = [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        child: SizedBox(width: width * 0.5, child: const SearchBarMaterial()),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        child: Tooltip(
          message: "Pesanan",
          child: IconButton(
            onPressed: isSignedIn ? () {} : null,
            icon: const Badge(child: Icon(Icons.shopping_cart)),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        child: Tooltip(
          message: "Pembayaran",
          child: IconButton(
            onPressed: isSignedIn ? () {} : null,
            icon: const Badge(child: Icon(Icons.payment)),
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        child: VerticalDivider(),
      ),
      isSignedIn
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              child: TextButton(
                onPressed: () async {
                  await authController.signOut();
                  setState(() {
                    getCurrentUser();
                  });
                },
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary),
                        image: DecorationImage(
                          image: Image.network(
                            'https://avatars.githubusercontent.com/u/126170803?s=40&v=4',
                            fit: BoxFit.cover,
                            scale: 0.9,
                          ).image,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 4),
                      child: Text(
                        currentUser!.email!,
                        style: const TextStyle(
                          // create trunch text
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Expanded(
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInPage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.login_outlined),
                      label: const Text(
                        'Masuk',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      icon: Icon(Icons.person_add,
                          color: Theme.of(context).colorScheme.onPrimary),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).colorScheme.primary),
                      ),
                      label: Text('Daftar',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary)),
                    ),
                  ),
                ],
              ),
            )
    ];

    return AppBar(
      shadowColor: Theme.of(context).colorScheme.primary,
      toolbarHeight: 72,
      elevation: 0.3,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        child: Text(
          'Hotel Kelompok 4',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      actions: [...actions],
    );
  }

  Widget gridBuilder() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      // scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisExtent: 280,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2.0,
      ),
      itemCount: kamarModel.length,
      itemBuilder: (context, index) {
        KamarModel kamar = kamarModel[index];
        return KamarCard(kamar: kamar, parallax: parallax);
      },
    );
  }

  Widget customScrollView(BuildContext context) {
    double widht = MediaQuery.of(context).size.width;
    double verticalPadding = MediaQuery.of(context).size.height * 0.01;
    double horizontalPadding = widht * 0.1;
    int crossAxisCount = 5;
    if (widht > 1920) {
      crossAxisCount = 5;
    } else if (widht > 1200) {
      crossAxisCount = 4;
    } else if (widht > 900) {
      crossAxisCount = 3;
    } else if (widht > 600) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 1;
    }

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: verticalPadding, horizontal: horizontalPadding),
            child: const CarouselBanner(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisExtent: 320,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2.0,
            ),
            itemCount: kamarModel.length,
            itemBuilder: (context, index) {
              KamarModel kamar = kamarModel[index];
              return KamarCard(kamar: kamar, parallax: parallax);
            },
          ),
        )
      ],
    );
  }
}
